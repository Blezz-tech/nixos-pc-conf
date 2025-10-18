{ pkgs
, ...
}:{
  
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
        zdyPackages =
          let
            versions = [
              { name = "1_7_2b"; zdy_version = "1.7.2b"; zdy_hash = "sha256-59kG0UA+zUkpL/ZOwjSEpOlGJspgI8bQapxdv/FvzX8="; }
              { name = "1_8_0";  zdy_version = "1.8.0";  zdy_hash = "sha256-GgDxB2GFnQizvY2kiBs7E9lgvxn4KwxRcOZBAeUXCPk="; }
              { name = "1_8_3";  zdy_version = "1.8.3";  zdy_hash = "sha256-xpq/I9oOhgl7i7tRMsj9P/ka6rvdMfGt88VxGwOPDLM="; }
              { name = "1_8_5";  zdy_version = "1.8.5";  zdy_hash = "sha256-paT29uftOnbViXM1X5aX7p6cKNrFDUCRX7Pjp/+TyO8="; }
            ];
          in
          builtins.listToAttrs (map
            (v: {
              name = v.name;
              value = pkgs.callPackage ./pkgs/zapret-discord-youtube {
                zdy_version = v.zdy_version;
                zdy_hash = v.zdy_hash;
              };
            })
            versions);

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

            v2025_1_1 = (pkgs.jetbrains.phpstorm.overrideAttrs (oldAttrs: {
              src = builtins.fetchurl {
                url = "file:///run/media/jenya/disk_d/binfiles/MURMUR-PHP-2025.1.1.tar.gz";
                sha256 = "sha256:18znpgjlk8740p7j2dfs5jmdw5k0f4bzd2lpaikmdf2xf7m24ixn";
              };
            }));

            v2025_2_1 = (pkgs.jetbrains.phpstorm.overrideAttrs (oldAttrs: {
              src = builtins.fetchurl {
                url = "file:///run/media/jenya/disk_d/binfiles/MURMUR-PHP-2025.2.1.tar.gz";
                sha256 = "sha256:076fwkfdyi7v3ng9fy4cx479kdvza5s54g5c6cdxqinf380vp1qh";
              };
            }));
          };

          CLION = {
            v2025_2_2 = (pkgs.jetbrains.clion.overrideAttrs (oldAttrs: {
              src = builtins.fetchurl {
                url = "file:///home/jenya/CLion-2025.2.2.tar.gz";
                sha256 = "sha256:01h6fd8yz9q7b51nfyha7cpnfjdrsvgk925j8dkmhqrshlf4zf27";
              };
            }));
            v2025_2_1 = (pkgs.jetbrains.clion.overrideAttrs (oldAttrs: {
              src = builtins.fetchurl {
                url = "file:///home/jenya/CLion-2025.2.1.tar.gz";
                sha256 = "sha256:0j06cdb8r9na0f5hqfwqf535c8k25a6dqwkxvgpm5xkja4g1l3pm";
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
    (import ./overlays/envvar.nix)
  ];
}