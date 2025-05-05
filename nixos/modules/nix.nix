{
  nix = {
    optimise.automatic = true;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      # system-features = [
      #   "gccarch-alderlake"
      #   "gcctune-alderlake"
      #   "benchmark"
      #   "big-parallel"
      #   "kvm"
      #   "nixos-test"
      # ];
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
