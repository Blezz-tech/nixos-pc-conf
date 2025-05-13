{ pkgs
, lib
, ...
}: {
  imports = [
    ./modules
    ./services
    ./programs
    ./packages.nix
    ./hardware-configuration.nix
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

  nixpkgs.overlays = [
    (self: super: {
      blezz-pkgs = {
        dabruks = pkgs.callPackage ./pkgs/dabruks { };
        dabkrs = pkgs.callPackage ./pkgs/dabkrs { };
        gt-vein-info = pkgs.callPackage ./pkgs/gt-vein-info { };
        voxelengine-cpp = pkgs.callPackage ./pkgs/voxelengine-cpp { };
        zapret = pkgs.zapret.overrideAttrs (prev: {
          postInstall = (prev.postInstall or "") + ''
            mkdir -p $out/files/
            cp -r $src/files/fake/ $out/files/
          '';
        });
        discord-krisp-patcher =
          pkgs.writers.writePython3Bin "discord-krisp-patcher"
            {
              libraries = with pkgs.python3Packages; [
                capstone
                pyelftools
              ];
              flakeIgnore = [
                "E501" # line too long (82 > 79 characters)
                "F403" # 'from module import *' used; unable to detect undefined names
                "F405" # name may be undefined, or defined from star imports: module
              ];
            }
            (builtins.readFile ./pkgs/discord-krisp-patcher/main.py);
        # Script get from: https://pastebin.com/raw/8tQDsMVd

        davinci-resolve = pkgs.callPackage ./pkgs/davinci {
          studioVariant = true;
        };
      };
    })
  ];
}
