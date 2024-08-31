{ pkgs
, ...
}:

let
  myPHPWithExtensions = pkgs.php83.withExtensions ({ enabled, all }: enabled ++ [
    all.bcmath
    all.tokenizer
    all.curl
    all.gd
    all.intl
    all.xml
    all.mbstring
    all.zip
    all.sqlite3
    all.pdo_mysql
    all.mysqli
    all.redis # Для Redis
  ]);
  myComposerWithPHPExtensions = myPHPWithExtensions.packages.composer;
in {

  programs = {
    bun.enable = true;
    java.enable = true;
    fastfetch.enable = true;
    freetube.enable = true;
    obs-studio.enable = true;
    pandoc.enable = true;
    yt-dlp.enable = true;
  };

  home.packages = with pkgs; [
    # FOR QSOFT

    myPHPWithExtensions
    myComposerWithPHPExtensions



    # LaTeX
    # texlive.combined.scheme-full
    pdf2svg

    # Torrent
    qbittorrent

    # Альтернатива Postman'у
    # insomnia

    # 3D редакторы
    blender

    # Музыкальные редакторы
    musescore

    # Месседжеры
    discord
    # element-desktop
    telegram-desktop
    # discord-screenaudio
    # webcord-vencord
    vesktop
    # whatsapp-for-linux

    # Редакторы epub
    # sigil

    # Графические редакторы
    # gimp
    # inkscape
    krita
    drawio

    # Текстовые редакторы
    libreoffice-qt-fresh
    onlyoffice-bin_latest

    # Браузеры
    # google-chrome
    tor-browser

    # Игры
    prismlauncher
    cataclysm-dda
    # cmatrix
    # keeperrl
    # minetest
    # wesnoth
    # openspades
    # airshipper

    # unciv
    # endless-sky
    # openra
    # osu-lazer
    # the-powder-toy
    # crawlTiles
    # hedgewars
    # tome4
    # warzone2100
    # tome4
    # openspades
    # openclonk
    # opentyrian
    # simutrans
    # redeclipse
    # openrct2
    # openttd
    # stuntrally
    # neverball
    # widelands
    # warsow
    # urbanterror
    ## pixel dungeons
    # shorter-pixel-dungeon
    # summoning-pixel-dungeon
    # experienced-pixel-dungeon
    # rat-king-adventure
    # rkpd2
    # shattered-pixel-dungeon

    # kdePackages.kolf
    # kdePackages.kmahjongg
    # kdePackages.knights
    # kdePackages.knavalbattle
    # kdePackages.kmines
    # kdePackages.picmi
    # kdePackages.ksudoku
    # kdePackages.kpat

    # kdePackages.ksirk
    # kdePackages.kajongg
    # kdePackages.kwordquiz

    # На сортировку
    python3
    # nodejs
    sqlitebrowser
    nixpkgs-fmt
    nixd
    # gnumake
    # tiled
    unityhub
    # pdfarranger
    # ihp-new
    cachix
    # vengi-tools
    # ldtk
    # easyocr
    # rhvoice
    # speechd
    # figma-linux
    # ventoy-full
    # appimage-run
    # age
    # sops
    imagemagick
    # crow-translate
    zoom-us

    # poppler_utils
    # ocrmypdf
    # stack
    # nheko
    # kdePackages.neochat
    # fractal

    # kalzium
    baobab
    kdePackages.filelight # For Dolphin Integration
    bottles
    protonup-qt
    r2modman
    audacity

    digikam
    exiftool

    kdenlive
    glaxnimate
    appimage-run
    mdbook
    mdbook-epub
    mdbook-pdf
    calibre
    gpu-viewer
    vulkan-tools
    pwgen
    coppwr
    ryujinx
    github-desktop
    nufmt
    omegat
    ghc
    # rustdesk
    anilibria-winmaclinux
    anime4k
    fd
    gcc
    kdePackages.kolourpaint
    iagno
    lunarvim
    remmina
    kdePackages.kcalc
    kdePackages.kclock
    # flameshot

    black # python formattier

    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    # uwufetch
    neofetch
    # nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    # ripgrep # recursively searches directories for a regex pattern
    # jq # A lightweight and flexible command-line JSON processor
    # yq-go # yaml processer https://github.com/mikefarah/yq


    # networking tools
    # mtr # A network diagnostic tool
    # iperf3
    # dnsutils # `dig` + `nslookup`
    # ldns # replacement of `dig`, it provide the command `drill`
    # aria2 # A lightweight multi-protocol & multi-source command-line download utility
    # socat # replacement of openbsd-netcat
    # nmap # A utility for network discovery and security auditing
    # ipcalc # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    # hugo # static site generator
    # glow # markdown previewer in terminal

    btop # replacement of htop/nmon
    # iotop # io monitoring
    # iftop # network monitoring

    # system call monitoring
    # strace # system call monitoring
    # ltrace # library call monitoring
    # lsof # list open files

    # system tools
    # sysstat
    # lm_sensors # for `sensors` command
    # ethtool
    pciutils # lspci
    usbutils # lsusb
  ];
}
