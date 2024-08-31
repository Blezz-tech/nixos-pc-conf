{
  description = "Jenya NixOS Flake Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # nixvim.url = "github:nix-community/nixvim";
    # nixvim.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      username = "jenya";
    in
    {
      nixosConfigurations."pc" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username; };
        modules = [
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
