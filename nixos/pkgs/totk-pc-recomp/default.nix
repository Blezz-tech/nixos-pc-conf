{
  lib,
  fetchurl,
  appimageTools,
  buildFHSEnv,
  makeDesktopItem,
  writeShellScript,
  runtimeShell,
  enablePgo ? false,
}:

let
  pname = "totk-pc-recomp";
  version = "0.4.1";

  src = fetchurl (
    if enablePgo then
      {
        url = "https://github.com/valentderah/totk-pc-recomp/releases/download/v${version}/TotK-Setup-${version}-x86_64-pgo.AppImage";
        hash = "sha256-y5GqfVyQpCvk3olswvmVIg0dQLypuMqWCIoWFlSo0fY=";
      }
    else
      {
        url = "https://github.com/valentderah/totk-pc-recomp/releases/download/v${version}/TotK-Setup-${version}-x86_64.AppImage";
        hash = "sha256-XtxsliNBn7/eg8fn/XueALtgTFKRonsgD67f01geaME=";
      }
  );

  appimageContents = appimageTools.extract {
    inherit pname version src;
  };

  entryScript = writeShellScript "${pname}-entry" ''
    set -euo pipefail

    run_setup() {
      exec "${appimageContents}/AppRun" "$@"
    }

    run_cli() {
      export PYTHONDONTWRITEBYTECODE=1
      export PYTHONNOUSERSITE=1
      exec "${appimageContents}/python/bin/python3" -m installer "$@"
    }

    run_game() {
      local dir="$1"
      shift
      cd "$dir"
      exec ./totk "$@"
    }

    case "''${TOTK_NIX_MODE:-play}" in
      setup)
        run_setup "$@"
        ;;
      cli)
        run_cli "$@"
        ;;
      play)
        if [ "$#" -gt 0 ]; then
          case "$1" in
            --setup)
              shift
              run_setup "$@"
              ;;
            --cli)
              shift
              run_cli "$@"
              ;;
          esac

          if [ -d "$1" ] && [ -x "$1/totk" ]; then
            dir="$1"
            shift
            run_game "$dir" "$@"
          elif [ -f "$1" ] && [ -x "$1" ] && [ "$(basename "$1")" = "totk" ]; then
            exe="$(readlink -f "$1")"
            shift
            cd "$(dirname "$exe")"
            exec "$exe" "$@"
          fi
        fi

        # Auto-detect the last install directory recorded by TotK-Setup
        dest="$(
          PYTHONDONTWRITEBYTECODE=1 PYTHONNOUSERSITE=1 \
            "${appimageContents}/python/bin/python3" -c '
import json, os, pathlib
state = os.environ.get("XDG_STATE_HOME") or os.path.expanduser("~/.local/state")
p = pathlib.Path(state) / "totk-recomp" / "setup.json"
try:
    d = json.loads(p.read_text(encoding="utf-8")).get("dest", "")
    if d and (pathlib.Path(d) / "totk").is_file():
        print(d)
except Exception:
    pass
'
        )"

        if [ -n "$dest" ] && [ -x "$dest/totk" ]; then
          run_game "$dest" "$@"
        fi

        if [ "$#" -gt 0 ]; then
          echo "totk-pc-recomp: no installed game found (pass an install folder, or run 'totk-setup' first)" >&2
          exit 1
        fi

        run_setup
        ;;
      *)
        echo "totk-pc-recomp: unknown mode ''${TOTK_NIX_MODE}" >&2
        exit 2
        ;;
    esac
  '';

  setupDesktop = makeDesktopItem {
    name = "totk-setup";
    desktopName = "TotK Recomp Setup";
    comment = "Build Tears of the Kingdom for this PC from your own game files";
    exec = "totk-setup";
    icon = "totk-pc-recomp";
    categories = [ "Game" ];
    terminal = false;
  };

  gameDesktop = makeDesktopItem {
    name = "totk-pc-recomp";
    desktopName = "The Legend of Zelda: Tears of the Kingdom (Recomp)";
    comment = "Static recompilation of The Legend of Zelda: Tears of the Kingdom";
    exec = "totk-pc-recomp";
    icon = "totk-pc-recomp";
    categories = [ "Game" ];
    terminal = false;
  };
in
buildFHSEnv {
  inherit pname version;

  targetPkgs =
    pkgs:
    (appimageTools.defaultFhsEnvArgs.targetPkgs pkgs)
    ++ (with pkgs; [
      dejavu_fonts
      vulkan-loader
    ]);

  multiPkgs =
    pkgs:
    (appimageTools.defaultFhsEnvArgs.multiPkgs pkgs)
    ++ (with pkgs; [
      libdecor
      stdenv.cc.cc.lib
    ]);

  runScript = "${entryScript}";

  extraInstallCommands = ''
    mkdir -p "$out/libexec"
    mv "$out/bin/totk-pc-recomp" "$out/libexec/totk-fhs"

    {
      echo "#!${runtimeShell}"
      echo 'export TOTK_NIX_MODE="''${TOTK_NIX_MODE:-play}"'
      echo "exec \"$out/libexec/totk-fhs\" \"\$@\""
    } > "$out/bin/totk-pc-recomp"
    chmod +x "$out/bin/totk-pc-recomp"

    {
      echo "#!${runtimeShell}"
      echo 'export TOTK_NIX_MODE="setup"'
      echo "exec \"$out/libexec/totk-fhs\" \"\$@\""
    } > "$out/bin/totk-setup"
    chmod +x "$out/bin/totk-setup"

    {
      echo "#!${runtimeShell}"
      echo 'export TOTK_NIX_MODE="cli"'
      echo "exec \"$out/libexec/totk-fhs\" \"\$@\""
    } > "$out/bin/totk-setup-cli"
    chmod +x "$out/bin/totk-setup-cli"

    install -Dm644 "${appimageContents}/totk-setup.png" "$out/share/pixmaps/totk-pc-recomp.png"
    mkdir -p "$out/share/applications"
    cp ${setupDesktop}/share/applications/*.desktop "$out/share/applications/"
    cp ${gameDesktop}/share/applications/*.desktop "$out/share/applications/"
  '';

  passthru = {
    inherit appimageContents src;
  };

  meta = {
    description = "Static recompilation of The Legend of Zelda: Tears of the Kingdom (Setup & FHS Runner)";
    homepage = "https://github.com/valentderah/totk-pc-recomp";
    license = lib.licenses.mit;
    platforms = [ "x86_64-linux" ];
    mainProgram = "totk-pc-recomp";
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
  };
}
