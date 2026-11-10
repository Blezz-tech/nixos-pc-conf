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
    # ./zapret.nix
  ];
}
