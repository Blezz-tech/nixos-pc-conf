{ pkgs
, ...
}:
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
    pkgs.blezz-pkgs.davinci-resolve

    # LSP
    pkgs.marksman # markdown
    pkgs.typescript-language-server # js/typescript
    pkgs.nixd # nix
    pkgs.nil # nix
    pkgs.vscode-langservers-extracted # css eslint html json markdown
    pkgs.yaml-language-server # yaml

    # formattiers
    pkgs.black # python
    pkgs.nixpkgs-fmt # nix

    # LaTeX
    # pkgs.texlive.combined.scheme-full
    pkgs.pdf2svg

    # Torrent
    pkgs.qbittorrent

    # Альтернатива Postman'у
    # pkgs.insomnia

    # 3D редакторы
    pkgs.blender-hip

    # Музыкальные редакторы
    pkgs.musescore
    # pkgs.obsidian

    # Месседжеры
    pkgs.discord-canary
    pkgs.element-desktop
    pkgs.telegram-desktop
    # pkgs.discord-screenaudio
    # pkgs.webcord-vencord

    # https://www.reddit.com/r/linux_gaming/comments/qv9n40/fix_for_the_lag_on_discord_on_linux_after_the/
    pkgs.vesktop # add flags --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy

    # pkgs.wpsoffice
    # pkgs.rstudio
    # pkgs.whatsapp-for-linux

    # Редакторы epub
    # pkgs.sigil

    # Графические редакторы
    # pkgs.gimp
    pkgs.inkscape
    pkgs.krita
    # pkgs.drawio
    # pkgs.aseprite

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
    (pkgs.python312.withPackages (python-pkgs: [
      python-pkgs.jupyter
      python-pkgs.ipykernel
      python-pkgs.pyautogui
      python-pkgs.scipy
      python-pkgs.pynput
      python-pkgs.numpy
      python-pkgs.pandas
      python-pkgs.matplotlib
      python-pkgs.sympy
      python-pkgs.plotly # NOTE: Долго билдится
    ]))
    pkgs.nodejs_latest
    pkgs.sqlitebrowser
    pkgs.code-cursor
    pkgs.graphviz
    pkgs.nodePackages_latest.prettier

    # pkgs.gnumake
    # pkgs.tiled
    # pkgs.unityhub
    # pkgs.pdfarranger
    # pkgs.ihp-new
    pkgs.cachix
    # pkgs.vengi-tools
    pkgs.ldtk
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
    pkgs.zoom-us
    pkgs.wl-clipboard
    # pkgs.revolt-desktop
    # pkgs.zim

    pkgs.poppler_utils
    pkgs.pdftk
    # pkgs.ocrmypdf
    # pkgs.tesseract
    # pkgs.stack
    # pkgs.nheko
    # pkgs.kdePackages.neochat
    # pkgs.fractal
    pkgs.mangohud
    # pkgs.kando

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
    pkgs.cura-appimage
    pkgs.nextcloud-client
    pkgs.nextcloud-talk-desktop
    # pkgs.geogebra6

    # pkgs.digikam
    pkgs.rawtherapee
    pkgs.exiftool # Для digikam
    pkgs.traceroute

    pkgs.go
    pkgs.lazygit
    pkgs.kdePackages.kdenlive
    # (pkgs.davinci-resolve-studio.overrideAttrs (old: {
    #   postInstall = ''
    #     ${old.postInstall or ""}
    #     # perl -pi -e 's/\x74\x11\xe8\x21\x23\x00\x00/\xeb\x11\xe8\x21\x23\x00\x00/g' $out/bin/resolve
    #     # perl -pi -e 's/\x74\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00/\xEB\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00/g' $out/bin/resolve
    #     # perl -pi -e 's/\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\x74\x11\x48\x8B\x45\xC8\x8B/\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\xEB\x11\x48\x8B\x45\xC8\x8B/g' $out/bin/resolve

    #     # echo -e "LICENSE blackmagic davinciresolvestudio 009599 permanent uncounted\nhostid=ANY issuer=AHH customer=AHH issued=03-Apr-2024\n akey=3148-9267-1853-4920-8173_ck=00 sig=\"00\"\n" > $out/.license/blackmagic.lic
    #   '';
    # }))
    # (pkgs.davinci-resolve-studio.overrideAttrs (old: {
    #   postFixup = ''
    #     ${old.postFixup or ""}
    #     ${pkgs.perl}/bin/perl -pi -e 's/\x74\x11\xe8\x21\x23\x00\x00/\xeb\x11\xe8\x21\x23\x00\x00/g' $out/bin/resolve
    #   '';
    # }))

    pkgs.mdbook
    pkgs.mdbook-epub
    pkgs.mdbook-pdf
    # pkgs.calibre
    pkgs.gpu-viewer
    pkgs.vulkan-tools
    pkgs.pwgen
    # pkgs.coppwr
    # pkgs.github-desktop
    pkgs.nufmt
    pkgs.omegat
    # pkgs.ghc
    pkgs.zotero
    pkgs.just
    pkgs.oxipng
    # pkgs.eaglemode # Весёлый файловый менеджер с разными минииграми
    pkgs.kdePackages.kompare

    # Rar archive
    pkgs.rar
    pkgs.unrar-free


    # pkgs.rustdesk
    pkgs.anilibria-winmaclinux
    pkgs.difftastic
    pkgs.anime4k
    pkgs.fd
    pkgs.haruna
    pkgs.gcc
    pkgs.kdePackages.kolourpaint
    pkgs.kdePackages.kleopatra
    # pkgs.kdePackages.kasts
    pkgs.iagno
    # pkgs.lunarvim
    # pkgs.treesheets
    # pkgs.openai-whisper # транскрибация аудио в текст
    pkgs.zbar
    pkgs.parsec-bin
    pkgs.remmina
    pkgs.kdePackages.kcalc
    pkgs.kdePackages.kclock
    # pkgs.kdePackages.juk
    # pkgs.kdePackages.kalzium
    # pkgs.kdePackages.kfind
    pkgs.kdePackages.kio-gdrive
    pkgs.kdePackages.kaccounts-integration
    pkgs.kdePackages.kaccounts-providers
    # pkgs.goldendict-ng
    pkgs.nix-search
    pkgs.ffmpeg-full
    pkgs.gh
    # pkgs.dig
    # pkgs.nekoray
    # pkgs.flameshot
    pkgs.chromium
    # pkgs.mysql-workbench
    pkgs.dbeaver-bin
    pkgs.treefmt
    # pkgs.zeal-qt6
    # pkgs.anki
    # pkgs.kdePackages.ksystemlog
    # pkgs.kdePackages.kio-gdrive
    # pkgs.kdePackages.kcharselect
    # pkgs.rars
    pkgs.freecad-wayland
    # pkgs.openscad
    # pkgs.openscad-lsp
    # pkgs.kicad
    # pkgs.zig
    # pkgs.sfxr
    # pkgs.sfxr-qt
    # pkgs.archivebox
    # pkgs.openapi-generator-cli
    pkgs.postman

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
