{ pkgs
, lib
, ...
}: {
  imports = [
    ./modules
    ./services
    ./packages.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos-jenya";

  time.timeZone = "Europe/Moscow";


  system.stateVersion = "24.05";


  # xdg_open should work in steam_run this way… well it’s not 
  # https://github.com/NixOS/nixpkgs/issues/160923
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };

  services.xserver = {
    enable = true;
    # videoDrivers = [ "amdgpu" ];

    # desktopManager.plasma5.enable = true;

    # Configure keymap in X11
    xkb.layout = "us,ru";
    xkb.variant = "";
  };

  services.desktopManager.plasma6.enable = true;

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      wayland.compositor = "kwin";
      package = lib.mkDefault pkgs.kdePackages.sddm;
    };
    autoLogin = {
      enable = true;
      user = "jenya";
    };
  };

  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "performance";

  nixpkgs.overlays = [
    # (self: super: {
    #   kdePackages = super.kdePackages // {
    #     powerdevil = super.kdePackages.powerdevil.overrideAttrs (oldAttrs: {
    #       buildInputs = oldAttrs.buildInputs ++ [ self.ddcutil ];
    #     });
    #   };
    # })
    (self: super: {
      blezz-pkgs.dabruks = pkgs.callPackage ../home/programs/pkgs/dabruks;
    })
    (self: super: {
      blezz-pkgs.dabkrs = pkgs.callPackage ../home/programs/pkgs/dabkrs;
    })
    # (self: super: {
    #   zapret-latest = super.zapret.overrideAttrs (oldAttrs: {
    #     src = pkgs.fetchFromGitHub {
    #       owner = "bol-van";
    #       repo = "zapret";
    #       rev = "v65.1";
    #       hash = "sha256-Wd9OqbhQwD7Lbi4zBcfgFSPvi8/K4G+xPso3VXtXdAI=";
    #     };
    #   });
    # })
  ];
}
