{ pkgs
, ...
}:
{
  programs = {
    bun.enable = true;
    java.enable = true;
    fastfetch.enable = true;
    freetube.enable = true;
    pandoc.enable = true;
    yt-dlp.enable = true;
  };

  home.packages = [
    # TODO add config got Home manager
    # pkgs.git-sim

    # Haskell
    # pkgs.haskell.packages.ghc9122.cabal-install
    # pkgs.haskell.packages.ghc9122.haskell-language-server
    # pkgs.haskell.packages.ghc9122.hlint
    # pkgs.haskell.packages.ghc9122.ghc
    # pkgs.ghciwatch


    # Torrent
    pkgs.qbittorrent
    pkgs.recoll

    # 3D редакторы
    # pkgs.blender-hip

    # Музыкальные редакторы
    # pkgs.musescore
    pkgs.obsidian


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

    # На сортировку
    pkgs.v2rayn
    # pkgs.nodejs_latest
    pkgs.sqlitebrowser
    # pkgs.code-cursor
    # pkgs.graphviz
    # pkgs.notepad-next
    # pkgs.distrobox
    # pkgs.auto-editor
    # pkgs.tiled
    # pkgs.unityhub
    # pkgs.ihp-new
    # pkgs.cachix
    # pkgs.vengi-tools
    # pkgs.ldtk
    # pkgs.easyocr
    # pkgs.rhvoice
    # pkgs.speechd
    # pkgs.figma-linux

    # pkgs.age
    # pkgs.sops
    # pkgs.far2l
    pkgs.imagemagick
    # pkgs.crow-translate
    # pkgs.zim
    # pkgs.stack
    pkgs.mangohud
    # pkgs.kando
    # pkgs.activate-linux


    # pkgs.baobab
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
    # pkgs.helix
    pkgs.gitoxide
    pkgs.lm_sensors # for information

    # analize count of line
    # pkgs.scc
    # pkgs.cloc

    pkgs.rustdesk-flutter
    # pkgs.anilibria-winmaclinux
    pkgs.difftastic
    # pkgs.anime4k
    pkgs.fd
    # pkgs.haruna
    # pkgs.treesheets
    # pkgs.openai-whisper # транскрибация аудио в текст
    pkgs.zbar
    # pkgs.parsec-bin
    # pkgs.remmina
    # pkgs.goldendict-ng
    pkgs.ffmpeg-full
    pkgs.gh
    # pkgs.dig
    # pkgs.nekoray
    # pkgs.flameshot

    # pkgs.mysql-workbench
    # pkgs.dbeaver-bin
    pkgs.treefmt
    pkgs.imhex
    # pkgs.zeal-qt6
    # pkgs.anki
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


    # misc
    pkgs.cowsay
    pkgs.file
    pkgs.which
    pkgs.tree
    pkgs.gnused
    pkgs.gnutar
    pkgs.gawk
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
