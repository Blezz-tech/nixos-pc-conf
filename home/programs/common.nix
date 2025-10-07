{ pkgs
, ...
}:
let
  myPHP.php = pkgs.php83.withExtensions ({ enabled, all }: enabled ++ [
    all.bcmath
    all.tokenizer
    all.curl
    all.gd
    all.intl
    # all.xml
    all.mbstring
    all.zip
    all.sqlite3
    all.pdo_mysql
    all.mysqli
    all.redis # Для Redis
  ]);
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
  python-custom = (pkgs.python313.withPackages (python-pkgs: [
    # python-pkgs.jupyter
    # python-pkgs.ipykernel
    # python-pkgs.pyautogui
    python-pkgs.scipy
    # python-pkgs.pynput
    python-pkgs.numpy
    python-pkgs.pandas
    python-pkgs.matplotlib
    python-pkgs.sympy
    python-pkgs.scikit-learn
    python-pkgs.nltk
    python-pkgs.pymorphy3
    # python-pkgs.plotly # NOTE: Долго билдится
    python-pkgs.torch
    python-pkgs.python-lsp-server
    python-pkgs.beautifulsoup4
    python-pkgs.black # python formattier
    python-pkgs.jupyter
    python-pkgs.notebook
  ]));
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
    # pkgs.blezz-pkgs.davinci-resolve
    pkgs.blezz-pkgs.MURMUR.CLION.v2025_2_2
    myPHP.php
    myPHP.php.packages.composer
    myPHP.php.packages.php-codesniffer

    # TODO add config got Home manager
    # pkgs.git-sim

    # LSP
    pkgs.marksman # markdown
    pkgs.typescript-language-server # js/typescript
    pkgs.nixd # nix
    pkgs.nil # nix
    pkgs.vscode-langservers-extracted # css eslint html json markdown
    pkgs.yaml-language-server # yaml

    # formattiers
    pkgs.nixpkgs-fmt # nix

    # LaTeX
    # pkgs.texlive.combined.scheme-full
    tex
    pkgs.ghostscript
    pkgs.pdf2svg

    # Haskell
    pkgs.haskell.packages.ghc9122.cabal-install
    pkgs.haskell.packages.ghc9122.haskell-language-server
    pkgs.haskell.packages.ghc9122.hlint
    pkgs.haskell.packages.ghc9122.ghc
    pkgs.ghciwatch

    # Agda and coq (rocq)
    # pkgs.agda
    # pkgs.coq
    # pkgs.coqPackages.vscoq-language-server

    # Torrent
    pkgs.qbittorrent

    # Альтернатива Postman'у
    # pkgs.insomnia

    # 3D редакторы
    # pkgs.blender-hip

    # Музыкальные редакторы
    pkgs.musescore
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
    pkgs.krita
    pkgs.drawio
    pkgs.aseprite

    # Текстовые редакторы
    pkgs.libreoffice-qt6-fresh
    pkgs.onlyoffice-bin_latest

    # Браузеры
    pkgs.google-chrome
    pkgs.tor-browser
    # pkgs.yandex-browser-corporate
    # pkgs.brave

    # На сортировку
    # pkgs.python3
    python-custom
    pkgs.uv
    # pkgs.kdePackages.wallpaper-engine-plugin
    # pkgs.nodejs_latest
    pkgs.sqlitebrowser
    # pkgs.code-cursor
    # pkgs.graphviz
    # pkgs.nodePackages_latest.prettier
    # pkgs.cmake
    # pkgs.notepad-next
    # pkgs.distrobox
    # pkgs.auto-editor

    # pkgs.gnumake
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
    pkgs.bash-language-server
    pkgs.imagemagick
    # pkgs.crow-translate
    pkgs.wl-clipboard
    # pkgs.revolt-desktop
    # pkgs.zim

    pkgs.poppler_utils
    pkgs.pdftk
    pkgs.mupdf
    # pkgs.ocrmypdf
    # pkgs.tesseract
    # pkgs.stack
    # pkgs.nheko
    # pkgs.kdePackages.neochat
    # pkgs.fractal
    # pkgs.mangohud
    # pkgs.kando
    # pkgs.activate-linux

    # Словари для libreoffice
    pkgs.hunspell
    pkgs.hunspellDicts.ru_RU
    pkgs.hunspellDicts.en_US

    # Словари
    pkgs.aspell
    pkgs.aspellDicts.en
    pkgs.aspellDicts.en-computers
    pkgs.aspellDicts.en-science
    pkgs.aspellDicts.ru

    # pkgs.baobab
    pkgs.kdePackages.filelight # For Dolphin Integration
    pkgs.kdePackages.kdialog # Для arx libertatis
    pkgs.audacity
    pkgs.kdePackages.xwaylandvideobridge
    # pkgs.cura
    # pkgs.cura-appimage
    # pkgs.nextcloud-client
    # pkgs.nextcloud-talk-desktop
    # pkgs.geogebra6
    pkgs.okteta

    pkgs.digikam
    # pkgs.rawtherapee
    pkgs.traceroute

    # pkgs.go
    pkgs.lazygit
    # pkgs.git-spice
    pkgs.ast-grep
    pkgs.luarocks
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
    pkgs.nufmt
    pkgs.omegat
    pkgs.zotero
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
    # pkgs.gcc
    pkgs.clang
    pkgs.clang-analyzer
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
    pkgs.nix-search
    pkgs.ffmpeg-full
    pkgs.gh
    # pkgs.dig
    # pkgs.nekoray
    # pkgs.flameshot
    (pkgs.chromium.override {
      commandLineArgs = [
        "--use-gl=angle"
        "--use-angle=vulkan"
        "--ignore-gpu-blocklist"
        "--enable-gpu-rasterization"
        "--enable-zero-copy"
        "--enable-accelerated-video-decode"
        "--ozone-platform-hint=wayland"
        "--enable-features=VaapiVideoDecoder,AcceleratedVideoEncoder,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE,UseMultiPlaneFormatForHardwareVideo,PlatformHEVCDecoderSupport,UseOzonePlatform,AcceleratedVideoDecodeLinuxZeroCopyGL"
      ];
    })
    (pkgs.vivaldi.overrideAttrs (oldAttrs: {
      # dontWrapQtApps = false;
      # dontPatchELF = true;
      # nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ pkgs.kdePackages.wrapQtAppsHook ];

      # version = "6.9.3447.41";
      # commandLineArgs = [
      #   "--enable-blink-features=MiddleClickAutoscroll"
      #   "--use-gl=angle"
      #   "--use-angle=vulkan"
      #   "--ignore-gpu-blocklist"
      #   "--enable-gpu-rasterization"
      #   "--enable-zero-copy"
      #   "--enable-accelerated-video-decode"
      #   "--ozone-platform-hint=wayland"
      #   "--enable-features=Vulkan,VulkanFromANGLE,DefaultANGLEVulkan,VaapiIgnoreDriverChecks,VaapiVideoDecoder,AcceleratedVideoEncoder,UseMultiPlaneFormatForHardwareVideo,PlatformHEVCDecoderSupport,UseOzonePlatform"

      #   # For Fcitx5
      #   "--enable-wayland-ime=true"
      #   "--wayland-text-input-version=3"
      # ];
    }))

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

    ## Rust
    pkgs.cargo
    pkgs.rustc
    pkgs.rust-analyzer
    pkgs.rustfmt

    ## Typst
    pkgs.typst
    pkgs.typstfmt
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
    pkgs.runzip # Fixing zip archives

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
