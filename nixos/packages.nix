{ pkgs
, ...
}:
{

  environment.systemPackages = [
    pkgs.alacritty
    pkgs.telegram-desktop

    pkgs.testdisk-qt
    pkgs.ddrescue
    pkgs.ext4magic
    pkgs.libdecor
    # pkgs.jetbrains.pycharm-community

    pkgs.xdg-utils
    pkgs.git
    pkgs.wget
    pkgs.curl
    pkgs.firefox-wayland
    pkgs.vscode
    pkgs.pwgen
    pkgs.keepassxc
    pkgs.wireguard-tools
    pkgs.vopono

    pkgs.home-manager

    pkgs.steam-run
    # pkgs.lutris
    pkgs.lzip # for waydroid

    # Аудио видео проигрыватели
    pkgs.vlc

    # Диспеер раздеов дисков
    pkgs.partition-manager
  ];
}
