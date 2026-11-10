{ pkgs
, ...
}: {
  imports = [
    ./fwupd.nix
    # ./postgresql.nix
    # ./sunshine.nix
    ./syncthing.nix
    # ./tor.nix
    # ./v2raya.nix
    # ./weblate.nix
    # ./whoogle-search.nix
    # ./wivrn.nix
    # ./zapret.nix
  ];

  services.ollama = {
    enable = false;
    package = pkgs.ollama-rocm;
  };
}
