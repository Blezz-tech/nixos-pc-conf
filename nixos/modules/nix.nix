{
  nix = {
    optimise.automatic = true;

    settings = {
      trusted-public-keys = [
        "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" # haskell.nix
      ];
      substituters = [
        "https://cache.iog.io" # haskell.nix
      ];

      experimental-features = [
        "nix-command"
        "flakes"
      ];
      system-features = [
        "gccarch-alderlake"
        "gcctune-alderlake"
        "benchmark"
        "big-parallel"
        "kvm"
        "nixos-test"
      ];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
