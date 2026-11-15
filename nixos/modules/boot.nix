{ ... }: {
  # bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Заготовка под отдельные конфигурации загрузки (specialisation): вторая запись
  # в меню systemd-boot со своим набором модулей. Пример из документации nixpkgs,
  # реального файла ./path/to/file.nix нет — раскомментировать нечего.
  # specialisation."printing".configuration = {
  #   imports = [ ./path/to/file.nix ];
  # };
}
