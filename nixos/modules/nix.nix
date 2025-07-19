{
  nix = {
    optimise.automatic = true;

    settings = {
      trusted-public-keys = [
        # "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ=" # haskell.nix
        "ghc-nix.cachix.org-1:ziC/I4BPqeA4VbtOFpFpu6D1t6ymFvRWke/lc2+qjcg=" # GHC
      ];
      substituters = [
        # "https://cache.iog.io" # haskell.nix
        "https://ghc-nix.cachix.org" # GHC
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
      # max-jobs = 4;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
