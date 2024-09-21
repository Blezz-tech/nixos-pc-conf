{ pkgs
, ...
}:
{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ ];
  };

  environment.systemPackages = [
    pkgs.alacritty
    pkgs.telegram-desktop

    pkgs.testdisk-qt
    pkgs.ddrescue
    pkgs.ext4magic

    pkgs.xdg_utils
    pkgs.git
    pkgs.wget
    pkgs.curl
    pkgs.firefox
    pkgs.vscode
    pkgs.pwgen
    pkgs.keepassxc

    pkgs.home-manager

    pkgs.steam-run
    pkgs.lutris
    pkgs.lzip # for waydroid

    # Аудио видео проигрыватели
    pkgs.vlc

    # Диспеер раздеов дисков
    pkgs.partition-manager
  ];

  fonts.packages = [
    # Шрифты paratype
    pkgs.paratype-pt-sans
    pkgs.paratype-pt-mono
    pkgs.paratype-pt-serif

    # Шрифты terminus
    pkgs.terminus_font

    # Шрифты noto
    pkgs.noto-fonts
    pkgs.noto-fonts-lgc-plus
    pkgs.noto-fonts-cjk
    pkgs.noto-fonts-cjk-serif
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-color-emoji
    pkgs.noto-fonts-extra

    # Шрифты windows
    # pkgs.corefonts
    pkgs.vistafonts

    # Mono
    pkgs.hack-font

    # Остальные
    pkgs.ibm-plex

    pkgs.source-han-sans
    pkgs.font-awesome
    pkgs.source-code-pro
    pkgs.source-sans
    pkgs.source-sans-pro
    pkgs.nerdfonts
    pkgs.liberation_ttf
    pkgs.scientifica

    # A (mainly) Chinese Unicode font
    pkgs.wqy_microhei
  ];
}
