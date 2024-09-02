{ pkgs
, ...
}:

let
  myPHPWithExtensions = pkgs.php83.withExtensions ({ enabled, all }: enabled ++ [
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
  myComposerWithPHPExtensions = myPHPWithExtensions.packages.composer;
in
{
  services.mysql.enable = true;
  services.mysql.package = pkgs.mysql84;

  services.redis.servers."" = {
    enable = true;
  };

  environment.systemPackages = [
    # FOR QSOFT

    myPHPWithExtensions
    myComposerWithPHPExtensions

    pkgs.nodejs_22

    (pkgs.jetbrains.idea-ultimate.overrideAttrs (oldAttrs: {
      src = builtins.fetchurl {
        url = "file:///run/media/jenya/disk_d/binfiles/MURMUR-IDEA-2022.3.3.tar.gz";
        sha256 = "sha256:19hlac1xlc31vdrf3sl20kw90mfsl29qwgh31wdyymlanj2bs0n3";
      };
    }))

    (pkgs.jetbrains.phpstorm.overrideAttrs (oldAttrs: {
      src = builtins.fetchurl {
        url = "file:///run/media/jenya/disk_d/binfiles/MURMUR-PHP-2022.3.3.tar.gz";
        sha256 = "sha256:1a9fvjqnz93w5czsj7zf3j1nmq3107mhiwsgxxnb31gv5l1nd6np";
      };
    }))
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
