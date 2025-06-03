{
  description = "Jenya NixOS Flake Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    # nvf.url = "github:notashelf/nvf";
    # nvf.inputs.nixpkgs.follows = "nixpkgs";

    # nur.url = "github:nix-community/NUR";
    # nur.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs
    , home-manager
      # , nvf
      # , nur
    , ...
    }@inputs:
    let
      username = "jenya";
    in
    {
      nixosConfigurations."nixos-jenya" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username; };
        modules = [
          # nvf.nixosModules.default        
          # nur.modules.nixos.default
          ./nixos
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.jenya = import ./home;
              extraSpecialArgs = {
                inherit inputs username;
              };
            };
          }
        ];
      };
    };
}
