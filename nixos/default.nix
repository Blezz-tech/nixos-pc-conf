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
    (self: super: {
      blezz-pkgs = {
        dabruks = pkgs.callPackage ./pkgs/dabruks { };
        dabkrs = pkgs.callPackage ./pkgs/dabkrs { };
        goldendict-ng = super.goldendict-ng.overrideAttrs (oldAttrs: {
          src = super.fetchFromGitHub {
            owner = "xiaoyifang";
            repo = "goldendict-ng";
            rev = "v24.11.0-alpha.870ff080";
            hash = "sha256-/myO1tDdE3/yiMSmGiGfKqBhZekIsGheJ/VExyhQ+mg=";
          };
        });
        alvr = pkgs.callPackage ./pkgs/alvr { };
        gt-vein-info = pkgs.callPackage ./pkgs/gt-vein-info { };
        voxelengine-cpp = pkgs.callPackage ./pkgs/voxelengine-cpp { };
      };
    })
  ];
}
