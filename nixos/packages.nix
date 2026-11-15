# Пакеты уровня системы. Здесь только то, что нужно всей машине (диагностика,
# восстановление дисков, сетевые утилиты). Пользовательские приложения живут в
# home/programs/, а те, у которых есть модуль NixOS, — в nixos/programs/.
{ pkgs, ... }: {
  environment.systemPackages = [
    # Диагностика и восстановление дисков
    pkgs.testdisk-qt # восстановление таблиц разделов
    pkgs.ddrescue # побитовое копирование с обходом бэд-блоков
    pkgs.ext4magic # восстановление удалённых файлов ext4

    # Базовые сетевые и файловые утилиты (есть в консоли)
    pkgs.curl
    pkgs.wget
    pkgs.wget2
    pkgs.git
    pkgs.wireguard-tools # wg / wg-quick
    pkgs.xdg-utils # xdg-open
    pkgs.ntfs3g # монтирование NTFS (в т.ч. раздел Windows)

    # Оформление окон для Wayland-приложений вне Plasma (SDL/GLFW)
    pkgs.libdecor

    # Запуск чужих бинарей и AppImage-подобных сборок
    pkgs.steam-run
    pkgs.lzip # waydroid: распаковка образа

    # CLI home-manager. Не дубль: HM подключён как NixOS-модуль, а в этом режиме
    # он сам CLI не ставит — в home-manager/modules/programs/home-manager.nix
    # установка идёт под условием !submoduleSupport.enable
    pkgs.home-manager

    # Медиаплеер
    pkgs.vlc
  ];
}
