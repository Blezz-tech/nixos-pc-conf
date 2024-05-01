{
  imports = [
    ./modules
    ./packages.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-jenya";

  time.timeZone = "Europe/Moscow";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "23.11";


  # xdg_open should work in steam_run this way… well it’s not 
  # https://github.com/NixOS/nixpkgs/issues/160923
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];

    # desktopManager.plasma5.enable = true;

    # Configure keymap in X11
    xkb.layout = "us,ru";
    xkb.variant = "";
  };

  services.desktopManager.plasma6.enable = true;

  services.displayManager = {
    # sddm.enable = true;
    sddm.wayland.enable = true;
    # defaultSession = "plasmawayland";
    autoLogin = {
      enable = true;
      user = "jenya";
    };
  };
}
