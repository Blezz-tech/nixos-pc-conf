{
  imports = [
    ./fonts.nix
    ./i18n.nix
    ./networking.nix
    ./nix-ld.nix
    ./nix.nix
    ./openssh.nix
    ./opentablet.nix
    ./podman.nix
    ./sound.nix
    ./specialisation.nix
    ./tty.nix
    ./user.nix
    ./vr.nix
    ./xserver.nix
    ./work
  ];

  # bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Чтобы не было ошибок
  programs.dconf.enable = true;

  # Менеджер разделов
  programs.partition-manager.enable = true;

  # Переменные окружения
  environment.variables.EDITOR = "nvim";
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # wayland для electron приложений

  # Для ГПУ AMD 
  programs.corectrl.enable = true;

  # Менеджер виртуальный машин
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Эмулятор Android
  # virtualisation.waydroid.enable = true;

  # nix helper
  programs.nh.enable = true;
  programs.nh.flake = "/home/jenya/nixos-pc-conf/";

  # nixpkgs settings
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ ];
  # nixpkgs.config.rocmSupport = true;

  # kmail
  # programs.kde-pim = {
  #   # kmail = true;
  #   kontact = true;
  #   merkuro = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # libinput.enable = true;

  # appimage-run
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # openvpn client
  # programs.openvpn3.enable = true;

  # MIME TYPE
  # xdg.mime.enable = true;
  # xdg.mime.addedAssociations = {
  #   "application/drawio" = "drawio.desktop";
  # };
}
