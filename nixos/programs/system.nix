{ ... }: {
  # Без dconf часть приложений (KDE-виджеты, gnome-части) ругается на отсутствие
  # хранилища настроек
  programs.dconf.enable = true;

  # Менеджер разделов KDE: тянет kdePackages.partitionmanager + kpmcore и
  # dbus-сервис. Отдельно в systemPackages его ставить не нужно
  programs.partition-manager.enable = true;

  # Разгон и управление вентиляторами для AMD GPU
  programs.corectrl.enable = true;

  # nix helper: nh os switch / nh clean all вместо ручного nixos-rebuild
  programs.nh = {
    enable = true;
    # Значение уходит в NH_FLAKE. Путь оставлен как был, с завершающим слэшем
    flake = "/home/jenya/nixos-pc-conf/";
  };

  # plasma6 ставит programs.kde-pim.enable = mkDefault true (nixpkgs/nixos/modules/
  # services/desktop-managers/plasma6.nix), и тогда прилетает весь KDE PIM:
  # akonadi, kmail, kontact, korganizer, akregator (~178 МиБ). Явный false это
  # перекрывает. Без этой строки набор пакетов системы вырастет
  programs.kde-pim.enable = false;

  # appimage-run: binfmt регистрирует обработчик, чтобы AppImage запускался
  # двойным щелчком без предварительного appimage-run
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}
