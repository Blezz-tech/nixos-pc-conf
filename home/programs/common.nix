{ pkgs
, ...
}:
let
  tex = (pkgs.texliveSmall.withPackages (
    ps: with ps; [
      fontspec
      polyglossia
      amsmath
      hyphen-russian
      standalone
      luatex85
      pgfplots
      cancel
      lualatex-math
      enumitem
    ]
  ));

in
{

  # gtk = {
  #   enable = true;
  #   font = {
  #     name = "Roboto";
  #     size = 8;
  #   };
  #   theme = {
  #     name = "Breeze-Dark";
  #     package = pkgs.kdePackages.breeze-gtk;
  #   };
  #   iconTheme = {
  #     name = "Papirus-Dark";
  #     package = pkgs.papirus-icon-theme;
  #   };
  #   cursorTheme = {
  #     name = "breeze_cursors";
  #     size = 24;
  #   };
  # };

  programs = {
    bun.enable = true;
    java.enable = true;
    fastfetch.enable = true;
    freetube.enable = true;
    pandoc.enable = true;
    yt-dlp.enable = true;
  };

  home.packages = [
    pkgs.blezz-pkgs.discord-krisp-patcher
    pkgs.blezz-pkgs.tg-ws-proxy
    # pkgs.blezz-pkgs.davinci-resolve
    # pkgs.blezz-pkgs.MURMUR.CLION.v2025_2_2

    # TODO add config got Home manager
    # pkgs.git-sim

    # LaTeX
    # pkgs.texlive.combined.scheme-full
    tex
    pkgs.ghostscript
    pkgs.pdf2svg

    # Haskell
    # pkgs.haskell.packages.ghc9122.cabal-install
    # pkgs.haskell.packages.ghc9122.haskell-language-server
    # pkgs.haskell.packages.ghc9122.hlint
    # pkgs.haskell.packages.ghc9122.ghc
    # pkgs.ghciwatch


    # Torrent
    pkgs.qbittorrent
    (pkgs.kdePackages.spectacle.override { tesseractLanguages = null; })
    pkgs.recoll

    # Альтернатива Postman'у
    # pkgs.insomnia

    # 3D редакторы
    # pkgs.blender-hip

    # Музыкальные редакторы
    # pkgs.musescore
    pkgs.obsidian

    # Месседжеры
    pkgs.discord-canary
    # pkgs.element-desktop
    pkgs.telegram-desktop
    # pkgs.discord-screenaudio
    # pkgs.webcord-vencord

    # https://www.reddit.com/r/linux_gaming/comments/qv9n40/fix_for_the_lag_on_discord_on_linux_after_the/
    pkgs.vesktop # add flags --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy

    # pkgs.wpsoffice
    # pkgs.rstudio
    # pkgs.whatsapp-for-linux

    # Редакторы epub
    pkgs.sigil

    # Графические редакторы
    # pkgs.gimp
    # pkgs.inkscape
    # pkgs.krita
    pkgs.drawio
    # pkgs.aseprite

    # Текстовые редакторы
    pkgs.libreoffice-qt-stable
    pkgs.onlyoffice-desktopeditors

    # Браузеры
    pkgs.google-chrome
    pkgs.tor-browser
    # pkgs.yandex-browser-corporate
    # pkgs.brave

    # На сортировку
    pkgs.v2rayn
    # pkgs.kdePackages.wallpaper-engine-plugin
    # pkgs.nodejs_latest
    pkgs.sqlitebrowser
    # pkgs.code-cursor
    # pkgs.graphviz
    # pkgs.nodePackages_latest.prettier
    # pkgs.notepad-next
    # pkgs.distrobox
    # pkgs.auto-editor

    # pkgs.tiled
    # pkgs.unityhub
    # pkgs.pdfarranger
    # pkgs.ihp-new
    # pkgs.cachix
    # pkgs.vengi-tools
    # pkgs.ldtk
    # pkgs.easyocr
    # pkgs.rhvoice
    # pkgs.speechd
    # pkgs.figma-linux
    # pkgs.ventoy-full
    # pkgs.age
    # pkgs.sops
    # pkgs.far2l
    pkgs.imagemagick
    # pkgs.crow-translate
    # pkgs.revolt-desktop
    # pkgs.zim

    pkgs.poppler-utils
    pkgs.pdftk
    pkgs.mupdf
    # pkgs.ocrmypdf
    # pkgs.tesseract
    # pkgs.stack
    # pkgs.nheko
    # pkgs.kdePackages.neochat
    # pkgs.fractal
    pkgs.mangohud
    # pkgs.kando
    # pkgs.activate-linux

    # Словари для libreoffice
    pkgs.hunspell
    pkgs.hunspellDicts.ru_RU
    pkgs.hunspellDicts.en_US

    # Словари
    pkgs.aspell
    pkgs.aspellDicts.en
    pkgs.aspellDicts.ru

    # pkgs.baobab
    pkgs.kdePackages.filelight # For Dolphin Integration
    pkgs.kdePackages.kdialog # Для arx libertatis
    # pkgs.audacity
    # pkgs.cura
    # pkgs.cura-appimage
    # pkgs.nextcloud-client
    # pkgs.nextcloud-talk-desktop
    # pkgs.geogebra6
    # pkgs.okteta

    # pkgs.digikam
    # pkgs.rawtherapee
    pkgs.traceroute

    # pkgs.go
    pkgs.lazygit
    # pkgs.git-spice
    pkgs.ast-grep
    # pkgs.kdePackages.kdenlive

    pkgs.mdbook
    pkgs.mdbook-admonish
    # pkgs.mdbook-epub
    # pkgs.mdbook-pdf

    # pkgs.calibre
    # pkgs.gpu-viewer
    pkgs.vulkan-tools
    pkgs.pwgen
    pkgs.coppwr
    # pkgs.github-desktop
    pkgs.omegat
    # pkgs.zotero
    # pkgs.just
    pkgs.oxipng # multithreaded lossless PNG/APNG compression optimizer
    pkgs.colorized-logs # ansi2txt
    # pkgs.eaglemode # Весёлый файловый менеджер с разными минииграми
    pkgs.kdePackages.kompare
    # pkgs.helix
    pkgs.gitoxide
    pkgs.lm_sensors # for information

    # Rar archive
    pkgs.rar
    pkgs.unrar-free

    # analize count of line
    # pkgs.scc
    # pkgs.cloc

    pkgs.rustdesk-flutter
    # pkgs.anilibria-winmaclinux
    pkgs.difftastic
    # pkgs.anime4k
    pkgs.fd
    # pkgs.haruna
    # pkgs.kdePackages.kolourpaint
    pkgs.kdePackages.kleopatra
    # pkgs.kdePackages.kasts
    # pkgs.treesheets
    # pkgs.openai-whisper # транскрибация аудио в текст
    pkgs.zbar
    # pkgs.parsec-bin
    # pkgs.remmina
    pkgs.kdePackages.kcalc
    pkgs.kdePackages.kclock
    # pkgs.kdePackages.juk
    # pkgs.kdePackages.kalzium
    # pkgs.kdePackages.kfind
    # pkgs.goldendict-ng
    pkgs.ffmpeg-full
    pkgs.gh
    # pkgs.dig
    # pkgs.nekoray
    # pkgs.flameshot
    pkgs.thunderbird
    pkgs.vivaldi

    # pkgs.mysql-workbench
    # pkgs.dbeaver-bin
    pkgs.treefmt
    pkgs.imhex
    # pkgs.zeal-qt6
    # pkgs.anki
    # pkgs.kdePackages.ksystemlog
    pkgs.kdePackages.kjournald
    # pkgs.kdePackages.kio-gdrive
    # pkgs.kdePackages.kcharselect
    # pkgs.rars
    # pkgs.freecad-wayland
    # pkgs.openscad
    # pkgs.openscad-lsp
    # pkgs.kicad
    # pkgs.zig
    # pkgs.sfxr
    # pkgs.sfxr-qt
    # pkgs.archivebox
    # pkgs.openapi-generator-cli
    # pkgs.postman


    ## Typst
    pkgs.typst
    pkgs.typstyle
    pkgs.typst-live
    pkgs.tinymist



    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    pkgs.cpufetch
    # pkgs.neofetch
    # pkgs.nnn # terminal file manager

    # pkgs.archives
    pkgs.zip
    pkgs.xz
    pkgs.unzip
    pkgs._7zz

    # pkgs.utils
    pkgs.ripgrep # recursively searches directories for a regex pattern
    pkgs.jq # A lightweight and flexible command-line JSON processor
    # pkgs.yq-go # yaml processer https://github.com/mikefarah/yq


    # pkgs.networking tools
    # pkgs.mtr # A network diagnostic tool
    # pkgs.iperf3
    # pkgs.dnsutils # `dig` + `nslookup`
    # pkgs.ldns # replacement of `dig`, it provide the command `drill`
    pkgs.aria2 # A lightweight multi-protocol & multi-source command-line download utility
    pkgs.socat # replacement of openbsd-netcat
    pkgs.nmap # A utility for network discovery and security auditing
    # pkgs.ipcalc # it is a calculator for the IPv4/v6 addresses
    # pkgs.runzip # Fixing zip archives

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
