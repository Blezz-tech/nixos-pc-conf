{ pkgs
, ...
}:

let
  myPHP.php = pkgs.php83.withExtensions ({ enabled, all }: enabled ++ [
    all.bcmath
    all.tokenizer
    all.curl
    all.gd
    all.intl
    # all.xml
    all.mbstring
    all.zip
    all.sqlite3
    all.pdo_mysql
    all.mysqli
    all.redis # Для Redis
  ]);

  myPHP.composer = myPHP.php.packages.composer;

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
in
{
  services.mysql.enable = true;
  services.mysql.package = pkgs.mysql84;

  services.redis.servers."" = {
    enable = true;
  };

  # services.nginx = {
  #   enable = true;
  #   enableReload = true;

  #   serverTokens = false;

  #   recommendedGzipSettings = true;
  #   recommendedOptimisation = true;
  #   recommendedProxySettings = true;
  #   recommendedTlsSettings = true;

  #   clientMaxBodySize = "32M";

  #   virtualHosts = {
  #     "qsoft.qsoft" = {
  #       forceSSL = false;
  #       enableACME = false;
  #       locations."/" = {

  #         proxyPass = "http://localhost:3000";
  #       };
  #     };
  #   };
  # };

  environment.systemPackages = [
    # FOR QSOFT

    myPHP.php
    myPHP.composer

    pkgs.postman

    pkgs.nodejs_22

    MURMUR.IDEA.v2024_2_1
    MURMUR.PHP.v2024_2_1
  ];

  # nixpkgs.overlays = [
  #   (self: super: {
  #     MURMUR_TOOLBOX = super.jetbrains-toolbox.overrideAttrs (oldAttrs: {
  #       src = self.fetchzip{
  #         url = "https://github.com/Blezz-tech/MURMUR_PANEL/releases/download/other/MURMUR_TOOLBOX.tar.gz";
  #         hash = "sha256-6sfO9tDIdp/xuNtqZ7UXqzP1SuLd6ZAF7lMTlaF3Z80=";
  #         stripRoot = false;
  #       };
  #     });
  #   })
  # ];
}
