{
  imports = [
    ./openssh.nix
    ./sound.nix
    ./steam.nix
    ./user.nix
  ];

  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Чтобы не было ошибок
  programs.dconf.enable = true;

  # Менеджер разделов
  programs.partition-manager.enable = true;

  # Сетевой менеждер
  networking.networkmanager.enable = true;
  
  # Переменные окружения
  environment.variables.EDITOR = "nvim";

  # Для ГПУ AMD 
  programs.corectrl.enable = false;

  # Менеджер виртуальный машин
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Эмулятор Android
  virtualisation.waydroid.enable = true;
}
