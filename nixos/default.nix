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

        MURMUR = {
          IDEA = {
            v2022_3_3 = (pkgs.jetbrains.idea-ultimate.overrideAttrs (oldAttrs: {
              src = builtins.fetchurl {
                url = "file:///run/media/jenya/disk_d/binfiles/MURMUR-IDEA-2022.3.3.tar.gz";
                sha256 = "sha256:19hlac1xlc31vdrf3sl20kw90mfsl29qwgh31wdyymlanj2bs0n3";
              };
            }));

            v2024_2_1 = (pkgs.jetbrains.idea-ultimate.overrideAttrs (oldAttrs: {
              src = builtins.fetchurl {
                url = "file:///run/media/jenya/disk_d/binfiles/MURMUR-IDEA-2024.2.1.tar.gz";
                sha256 = "sha256:0v9nc7n9xyzrmqlqi4shlnl4gijqcf1f84b26m6q2nxdrwqp90da";
              };
            }));
          };

          PHP = {
            v2022_3_3 = (pkgs.jetbrains.phpstorm.overrideAttrs (oldAttrs: {
              src = builtins.fetchurl {
                url = "file:///run/media/jenya/disk_d/binfiles/MURMUR-PHP-2022.3.3.tar.gz";
                sha256 = "sha256:1a9fvjqnz93w5czsj7zf3j1nmq3107mhiwsgxxnb31gv5l1nd6np";
              };
            }));

            v2024_2_1 = (pkgs.jetbrains.phpstorm.overrideAttrs (oldAttrs: {
              src = builtins.fetchurl {
                url = "file:///run/media/jenya/disk_d/binfiles/MURMUR-PHP-2024.2.1.tar.gz";
                sha256 = "sha256:00f0n80wazyqilmdi26zfa7xhjsq8c1lyjrjcmdx0p41fnc53px9";
              };
            }));
          };
        };
        # MURMUR_TOOLBOX = super.jetbrains-toolbox.overrideAttrs (oldAttrs: {
        #   src = self.fetchzip {
        #     url = "https://github.com/Blezz-tech/MURMUR_PANEL/releases/download/other/MURMUR_TOOLBOX.tar.gz";
        #     hash = "sha256-6sfO9tDIdp/xuNtqZ7UXqzP1SuLd6ZAF7lMTlaF3Z80=";
        #     stripRoot = false;
        #   };
        # });
      };
    })
  ];
}
