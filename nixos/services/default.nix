{
  imports = [
    # ./byedpi.nix
    # ./cloudflare-warp.nix
    # ./spoofdpi.nix
    # ./tor.nix
    ./wireguard.nix
  ];

  # services.v2raya.enable = true;

  # services.byedpi = {
  #   enable = true;
  #   openFirewall = true;
  #   socksPort = 3999;
  #   commandLine = "--disorder 1 --auto=torst --tlsrec 1+s";
  # };
}
