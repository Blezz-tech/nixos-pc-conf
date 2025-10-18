{ pkgs
, lib
, ...
}:
{
  imports = [
    ./modules
    ./services
    ./programs
    ./packages.nix
    ./hardware-configuration.nix
    ./overlays.nix
    ./config.nix
  ];

  time.timeZone = "Europe/Moscow";

  system.stateVersion = "25.05";

  # xdg_open should work in steam_run this way… well it’s not 
  # https://github.com/NixOS/nixpkgs/issues/160923
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
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

  # environment.shellInit = ''
  #   export XDG_DATA_DIRS=$(echo $XDG_DATA_DIRS | tr ':' '\n' | sort | uniq | tr '\n' ':')
  #   export XDG_DATA_DIRS=$(echo $XDG_DATA_DIRS | tr ':' '\n' | sort | uniq | tr '\n' ':')
  #   export QT_PLUGIN_PATH=$(echo $QT_PLUGIN_PATH | tr ':' '\n' | sort | uniq | tr '\n' ':')
  #   export XDG_CONFIG_DIRS=$(echo $XDG_CONFIG_DIRS | tr ':' '\n' | sort | uniq | tr '\n' ':')
  #   export NIXPKGS_QT6_QML_IMPORT_PATH=$(echo $NIXPKGS_QT6_QML_IMPORT_PATH | tr ':' '\n' | sort | uniq | tr '\n' ':')
  # '';
}
