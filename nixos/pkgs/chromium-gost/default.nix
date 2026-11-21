{ lib
, stdenv
, fetchurl
, dpkg
, autoPatchelfHook
, makeWrapper
, wrapGAppsHook3
, qt6
, alsa-lib
, at-spi2-core
, cairo
, cups
, curl
, dbus
, expat
, fontconfig
, freetype
, gdk-pixbuf
, glib
, gtk3
, libdrm
, libgbm
, libnotify
, libpulseaudio
, libuuid
, libx11
, libxcb
, libxcomposite
, libxcursor
, libxdamage
, libxext
, libxfixes
, libxi
, libxkbcommon
, libxkbfile
, libxrandr
, libxrender
, libxscrnsaver
, libxshmfence
, libxtst
, nspr
, nss
, pango
, systemd
, xdg-utils
}:

stdenv.mkDerivation rec {
  pname = "chromium-gost";
  version = "123.0.6312.86";

  src = fetchurl {
    url = "https://github.com/deemru/Chromium-Gost/releases/download/${version}/chromium-gost-${version}-linux-amd64.deb";
    hash = "sha256-MRtBThsUaGJ25htkqeunOO4ftLT2g3QZTtr7NIitxdc=";
  };

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
    makeWrapper
    wrapGAppsHook3
    qt6.wrapQtAppsHook
  ];

  buildInputs = [
    alsa-lib
    at-spi2-core
    cairo
    cups
    curl
    dbus
    expat
    fontconfig.lib
    freetype
    gdk-pixbuf
    glib
    gtk3
    libdrm
    libgbm
    libnotify
    libpulseaudio
    libuuid
    libx11
    libxcb
    libxcomposite
    libxcursor
    libxdamage
    libxext
    libxfixes
    libxi
    libxkbcommon
    libxkbfile
    libxrandr
    libxrender
    libxscrnsaver
    libxshmfence
    libxtst
    nspr
    nss
    pango
    qt6.qtbase
    stdenv.cc.cc.lib
    systemd
  ];

  # Libraries opened with dlopen rather than listed in DT_NEEDED.
  runtimeDependencies = map lib.getLib [
    curl
    libnotify
    libpulseaudio
    systemd
    gtk3
  ];

  # A single explicit wrapper combines the GTK and Qt environments.
  # Keep the upstream launcher in opt untouched by wrapper renaming:
  # it locates chrome and resources relative to its own real path.
  dontWrapGApps = true;
  dontWrapQtApps = true;
  dontConfigure = true;
  dontBuild = true;

  # The .deb contains opt/chromium-gost/chrome-sandbox with mode 4755
  # (rwsr-xr-x), and "dpkg-deb --extract" lets its internal tar restore that
  # mode. The Nix build sandbox does not allow setting the setuid bit, so the
  # whole extraction aborts with:
  #   tar: ./opt/chromium-gost/chrome-sandbox: Cannot change mode to rwsr-xr-x:
  #        Operation not permitted
  #   dpkg-deb: error: tar subprocess failed with exit status 2
  #
  # A setuid bit inside /nix/store would be useless anyway (the store is not
  # owned by root and Chromium's SUID sandbox must be owned by root), so ask
  # dpkg for the raw tar stream and extract it ourselves without restoring
  # permissions/ownership. chrome-sandbox then ends up as plain 0755, which
  # makes Chromium fall back to its unprivileged user-namespace sandbox.
  unpackPhase = ''
    runHook preUnpack
    dpkg-deb --fsys-tarfile "$src" \
      | tar -x -f - --no-same-owner --no-same-permissions
    runHook postUnpack
  '';
  sourceRoot = ".";

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/bin" "$out/share"
    cp -a opt "$out/"
    cp -a usr/share/. "$out/share/"

    # Chromium can use GTK or Qt6. The unused Qt5 shim would otherwise
    # force autoPatchelfHook to require an additional Qt5 closure.
    rm -f "$out/opt/${pname}/libqt5_shim.so"

    for desktopFile in "$out/share/applications/${pname}.desktop"; do
      if [ -e "$desktopFile" ]; then
        substituteInPlace "$desktopFile" \
          --replace-fail "/usr/bin/chromium-gost-stable" "$out/bin/${pname}"
      fi
    done

    gnomeDefaultApps="$out/share/gnome-control-center/default-apps/${pname}.xml"
    if [ -e "$gnomeDefaultApps" ]; then
      substituteInPlace "$gnomeDefaultApps" \
        --replace-fail "/opt/${pname}/${pname}" "$out/bin/${pname}"
    fi

    for size in 16 24 32 48 64 128 256; do
      iconDir="$out/share/icons/hicolor/''${size}x''${size}/apps"
      mkdir -p "$iconDir"
      ln -sfn "$out/opt/${pname}/product_logo_$size.png" \
        "$iconDir/${pname}.png"
    done

    # Explicitly patch scripts below opt as well as the usual bin dirs.
    patchShebangs "$out/opt/${pname}"

    runHook postInstall
  '';

  postFixup = ''
    makeWrapper "$out/opt/${pname}/${pname}" "$out/bin/${pname}" \
      "''${gappsWrapperArgs[@]}" \
      "''${qtWrapperArgs[@]}" \
      --prefix PATH : "${lib.makeBinPath [ xdg-utils ]}"
  '';

  meta = {
    description = "Chromium with GOST encryption support";
    homepage = "https://cryptopro.ru/products/chromium-gost";
    license = lib.licenses.bsd3;
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    mainProgram = "chromium-gost";
    platforms = [ "x86_64-linux" ];
  };
}
