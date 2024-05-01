{
  imports = [
    ./bootloader.nix
    ./corectrl.nix
    ./env.nix
    ./nm.nix
    ./openssh.nix
    ./sound.nix
    ./steam.nix
    ./user.nix
    ./virtmanager.nix
    ./waydroid.nix
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Чтобы не было ошибок
  programs.dconf.enable = true;

  # Менеджер разделов
  programs.partition-manager.enable = true;

  
}
