{ pkgs
, ...
}:
{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ ];
  };

  environment.systemPackages = with pkgs; [
    alacritty
    telegram-desktop

    testdisk-qt
    ddrescue
    ext4magic

    xdg_utils
    git
    wget
    curl
    firefox
    vscode
    pwgen
    keepassxc

    home-manager

    steam-run
    lutris

    # Аудио видео проигрыватели
    vlc

    # Диспеер раздеов дисков
    partition-manager
  ];

  fonts.packages = with pkgs; [
    # Шрифты paratype
    paratype-pt-sans
    paratype-pt-mono
    paratype-pt-serif

    # Шрифты terminus
    terminus_font

    # Шрифты noto
    noto-fonts
    noto-fonts-lgc-plus
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    noto-fonts-color-emoji

    # Шрифты windows
    # corefonts
    vistafonts

    # Mono
    hack-font

    # Остальные
    ibm-plex

    source-han-sans
    font-awesome
    source-sans
    source-sans-pro
    # nerdfonts
    liberation_ttf
    scientifica
  ];
}
