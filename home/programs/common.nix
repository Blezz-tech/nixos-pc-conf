{ pkgs
, ...
}:
let
  blezz-pkgs = pkgs.callPackage ./pkgs { };
in
{

  programs = {
    bun.enable = true;
    java.enable = true;
    fastfetch.enable = true;
    freetube.enable = true;
    obs-studio.enable = true;
    pandoc.enable = true;
    yt-dlp.enable = true;
  };

  home.packages = [
    blezz-pkgs.gt-vein-info
    blezz-pkgs.alvr

    # LaTeX
    # pkgs.texlive.combined.scheme-full
    pkgs.pdf2svg

    # Torrent
    pkgs.qbittorrent

    # Альтернатива Postman'у
    pkgs.insomnia

    # 3D редакторы
    pkgs.blender

    # Музыкальные редакторы
    pkgs.musescore

    # Месседжеры
    pkgs.discord
    # pkgs.element-desktop
    pkgs.telegram-desktop
    # pkgs.discord-screenaudio
    # pkgs.webcord-vencord
    pkgs.vesktop
    # pkgs.whatsapp-for-linux

    # Редакторы epub
    # pkgs.sigil

    # Графические редакторы
    # pkgs.gimp
    # pkgs.inkscape
    pkgs.krita
    pkgs.drawio

    # Текстовые редакторы
    pkgs.libreoffice-qt-fresh
    pkgs.onlyoffice-bin_latest

    # Браузеры
    # pkgs.google-chrome
    pkgs.tor-browser

    # На сортировку
    # pkgs.python3
    (pkgs.python312.withPackages (python-pkgs: [
      python-pkgs.pyautogui
      python-pkgs.pynput
    ]))
    # pkgs.nodejs
    pkgs.sqlitebrowser
    pkgs.nixpkgs-fmt
    pkgs.nixd
    # pkgs.gnumake
    # pkgs.tiled
    pkgs.unityhub
    # pkgs.pdfarranger
    # pkgs.ihp-new
    pkgs.cachix
    # pkgs.vengi-tools
    # pkgs.ldtk
    # pkgs.easyocr
    # pkgs.rhvoice
    # pkgs.speechd
    # pkgs.figma-linux
    # pkgs.ventoy-full
    # pkgs.appimage-run
    # pkgs.age
    # pkgs.sops
    pkgs.imagemagick
    pkgs.crow-translate
    pkgs.zoom-us

    pkgs.poppler_utils
    # pkgs.ocrmypdf
    # pkgs.stack
    # pkgs.nheko
    # pkgs.kdePackages.neochat
    # pkgs.fractal

    # pkgs.kalzium
    pkgs.baobab
    pkgs.kdePackages.filelight # For Dolphin Integration
    pkgs.bottles
    pkgs.protonup-qt
    pkgs.r2modman
    pkgs.audacity

    pkgs.digikam
    pkgs.exiftool

    pkgs.kdenlive
    pkgs.glaxnimate
    pkgs.appimage-run
    pkgs.mdbook
    pkgs.mdbook-epub
    pkgs.mdbook-pdf
    pkgs.calibre
    pkgs.gpu-viewer
    pkgs.vulkan-tools
    pkgs.pwgen
    pkgs.coppwr
    pkgs.ryujinx
    pkgs.github-desktop
    pkgs.nufmt
    pkgs.omegat
    pkgs.ghc
    # pkgs.rustdesk
    pkgs.anilibria-winmaclinux
    pkgs.anime4k
    pkgs.fd
    pkgs.gcc
    pkgs.kdePackages.kolourpaint
    pkgs.iagno
    pkgs.lunarvim
    pkgs.remmina
    pkgs.kdePackages.kcalc
    pkgs.kdePackages.kclock
    # pkgs.flameshot
    pkgs.chromium
    pkgs.mysql-workbench

    pkgs.black # python formattier

    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    # pkgs.uwufetch
    pkgs.neofetch
    # pkgs.nnn # terminal file manager

    # pkgs.archives
    pkgs.zip
    pkgs.xz
    pkgs.unzip
    pkgs.p7zip

    # pkgs.utils
    # pkgs.ripgrep # recursively searches directories for a regex pattern
    # pkgs.jq # A lightweight and flexible command-line JSON processor
    # pkgs.yq-go # yaml processer https://github.com/mikefarah/yq


    # pkgs.networking tools
    # pkgs.mtr # A network diagnostic tool
    # pkgs.iperf3
    # pkgs.dnsutils # `dig` + `nslookup`
    # pkgs.ldns # replacement of `dig`, it provide the command `drill`
    # pkgs.aria2 # A lightweight multi-protocol & multi-source command-line download utility
    # pkgs.socat # replacement of openbsd-netcat
    # pkgs.nmap # A utility for network discovery and security auditing
    # pkgs.ipcalc # it is a calculator for the IPv4/v6 addresses

    # misc
    pkgs.cowsay
    pkgs.file
    pkgs.which
    pkgs.tree
    pkgs.gnused
    pkgs.gnutar
    pkgs.gawk
    pkgs.zstd
    pkgs.gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    pkgs.nix-output-monitor

    # pkgs.productivity
    # pkgs.hugo # static site generator
    # pkgs.glow # markdown previewer in terminal

    pkgs.btop # replacement of htop/nmon
    # pkgs.iotop # io monitoring
    # pkgs.iftop # network monitoring

    # system call monitoring
    # pkgs.strace # system call monitoring
    # pkgs.ltrace # library call monitoring
    # pkgs.lsof # list open files

    # system tools
    # pkgs.sysstat
    # pkgs.lm_sensors # for `sensors` command
    # pkgs.ethtool
    pkgs.pciutils # lspci
    pkgs.usbutils # lsusb
  ];
}
