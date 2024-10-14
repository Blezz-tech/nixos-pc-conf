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

    pkgs.xdg_utils
    pkgs.git
    pkgs.wget
    pkgs.curl
    pkgs.firefox
    pkgs.vscode
    pkgs.pwgen
    pkgs.keepassxc
    pkgs.wireshark-qt

    pkgs.home-manager

    pkgs.steam-run
    pkgs.lutris
    pkgs.lzip # for waydroid

    # Аудио видео проигрыватели
    pkgs.vlc

    # Диспеер раздеов дисков
    pkgs.partition-manager
  ];
}
