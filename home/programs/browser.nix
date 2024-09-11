{ pkgs
, ...
}: {
  programs.chromium = {
    enable = true;
    package = (pkgs.vivaldi.overrideAttrs (oldAttrs: {
      dontWrapQtApps = false;
      dontPatchELF = true;
      nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ pkgs.kdePackages.wrapQtAppsHook ];
      # version = "6.9.3447.41";
    }));
    commandLineArgs = [
      # "--disable-features=AllowQt"
      "--enable-blink-features=MiddleClickAutoscroll"

      "--enable-features=VaapiVideoDecodeLinuxGL"
      "--proxy-server=http://127.0.0.1:3999"
      # "--ignore-gpu-blocklist"
      # "--enable-zero-copy"
    ];
  };
}
