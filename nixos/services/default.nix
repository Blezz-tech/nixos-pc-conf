{
  imports = [
    # ./spoofdpi.nix
    # ./tor.nix
    # ./wireguard.nix
    # ./zapret.nix
  ];

  services.v2raya.enable = true;
}
