{ pkgs
, ...
}:
{
  services.mysql.enable = true;
  services.mysql.package = pkgs.mysql84;

  services.redis.servers."" = {
    enable = true;
  };

  environment.systemPackages = [
    pkgs.nodejs_22


    pkgs.MURMUR_TOOLBOX
  ];

  nixpkgs.overlays = [
    (self: super: {
      MURMUR_TOOLBOX = super.jetbrains-toolbox.overrideAttrs (oldAttrs: {
        src = self.fetchzip{
          url = "https://github.com/Blezz-tech/MURMUR_PANEL/releases/download/other/MURMUR_TOOLBOX.tar.gz";
          hash = "sha256-6sfO9tDIdp/xuNtqZ7UXqzP1SuLd6ZAF7lMTlaF3Z80=";
          stripRoot = false;
        };
      });
    })
  ];
}
