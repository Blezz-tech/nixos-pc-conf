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
    pkgs.jetbrains.idea-ultimate.overrideAttrs (oldAttrs: {
      versions = {
        x86_64-linux = {
          idea-ultimate = {

          };
        };
      };
    })

#     {
#   "x86_64-linux": {
#     "idea-ultimate": {
#       "update-channel": "IntelliJ IDEA RELEASE",
#       "url-template": "https://download.jetbrains.com/idea/ideaIU-{version}.tar.gz",
#       "version": "2024.2.0.2",
#       "sha256": "cf2159b9ea61ea910d27ad0e661cdd93575f65cdb443f99bd15600f5960b7f4b",
#       "url": "https://drive.usercontent.google.com/download?id=1w-z0p-pMROW2xzPzRh9B6WsA_F0P7P3l&export=download&authuser=0&confirm=t&uuid=5f330f03-5987-4302-963f-2d599e096d35&at=AO7h07ddz2okNwDaLhjIAcy5_vtC:1725137225585",
#       "build_number": "242.20224.419"
#     }
#   }
# }

    # pkgs.MURMUR_TOOLBOX
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
