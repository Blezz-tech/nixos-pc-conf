{
  # Open ports for home manager options
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];


  # services.syncthing = {
  #   enable = true;
  #   openDefaultPorts = true; # Open ports in the firewall for Syncthing. (NOTE: this will not open syncthing gui port)
  #   overrideDevices = true;
  #   overrideFolders = true;
  #   settings = {
  #     devices = {
  #       # "pc-nixos-jenya" = { id = "JHDYZX7-3T6D53O-5XH5VO6-ASLUYIO-5KMGYO7-6JRYWPH-LFUDSBW-SLVLUAY"; };
  #       "poco-x3-pro" = { id = "RU33CWR-HPTNESJ-6DELDQQ-FZ2ERPA-W3TYRJH-N64ELRJ-YXUFKG6-ABSHRAX"; };
  #     };
  #     folders = {
  #       "/home/jenya/media/documents/" = {
  #         id = "5jyjs-qxyvz";
  #         label = "документы";
  #         devices = [ "poco-x3-pro" ];
  #         versioning = {
  #           type = "simple";
  #           params.keep = "50";
  #         };
  #       };
  #     };
  #   };
  # };
}
