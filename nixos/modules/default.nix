{
  imports = [
    ./fonts.nix
    ./i18n.nix
    # ./nix-ld.nix
    ./nix.nix
    ./openssh.nix
    # ./opentablet.nix
    ./podman.nix
    ./print_and_scan.nix
    ./sound.nix
    ./steam.nix
    ./tty.nix
    ./user.nix
    ./work
  ];

  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Чтобы не было ошибок
  programs.dconf.enable = true;

  # Менеджер разделов
  programs.partition-manager.enable = true;

  # Сетевой менеждер
  networking.networkmanager.enable = true;

  # Переменные окружения
  environment.variables.EDITOR = "nvim";
  # environment.sessionVariables.NIXOS_OZONE_WL = "1"; # wayland для electron приложений

  # Для ГПУ AMD 
  programs.corectrl.enable = true;

  # Менеджер виртуальный машин
  # virtualisation.libvirtd.enable = true;
  # programs.virt-manager.enable = true;

  # Эмулятор Android
  virtualisation.waydroid.enable = true;

  # nix helper
  programs.nh.enable = true;
  programs.nh.flake = "/home/jenya/nixos-pc-conf/";

  # nixpkgs settings
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ ];

  # kmail
  # programs.kde-pim = {
  #   # kmail = true;
  #   # kontact = true;
  #   merkuro = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # libinput.enable = true;

  # appimage-run
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # openvpn client
  programs.openvpn3.enable = true;

  # wireshark
  # programs.wireshark.enable = true;
}
