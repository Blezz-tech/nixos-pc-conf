{
  imports = [
    ./modules
    ./packages.nix
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos-jenya";

  time.timeZone = "Europe/Moscow";

  # xdg_open should work in steam_run this way… well it’s not 
  # https://github.com/NixOS/nixpkgs/issues/160923
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];

    desktopManager.plasma5.enable = true;

    # Configure keymap in X11
    xkb.layout = "us,ru";
    xkb.variant = "";
  };

  services.displayManager = {
    sddm.enable = true;
    # defaultSession = "plasmawayland";
    autoLogin = {
      enable = true;
      user = "jenya";
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # libinput.enable = true;
  };

  system.stateVersion = "23.11";
}
