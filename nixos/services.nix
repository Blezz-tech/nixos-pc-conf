{ pkgs
, ...
}: {
  imports = [
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


  services.fwupd = {
    enable = true;
  };


  # services.postgresql = {
  #   enable = true;
  #   enableJIT = true;
  #   # TODO: Попробовать сделать auth-method = scram-sha-256
  #   authentication = lib.mkOverride 10 ''
  #     #type database  DBuser  auth-method
  #     local all       all     trust

  #     #type database  DBuser  ipv4         auth-method
  #     host  all       all     127.0.0.1/32 trust
  #   '';
  # };


  # services.sunshine = {
  #   enable = true;
  # };


  ## Syncthing
  # Open ports for home manager options for syncthing
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];

  # Disabeld becouse using home manager module for syncthing
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


  # services.tor = {
  #   enable = true;
  #   enableGeoIP = false;
  #   client.enable = true;
  #   client.dns.enable = true;
  #   settings = {
  #     ExcludeExitNodes = "{RU},{UA},{BY},{KZ}";
  #     UseBridges = true;
  #     ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
  #     Bridge = ''
  #       obfs4 51.91.145.55:43695 FC16ACBD3DF13A99728892818ADAD0E0B24B9651 cert=OFqWfnJddrEZivZjzuaru55TPyOPyvaE/Z4msTd3lNg7WY/PwzbrPJB4cVjfg4kMlSORYw iat-mode=0
  #     '';
  #   };
  # };


  # services.v2raya = {
  #   enable = true;
  # };


  # services.weblate = {
  #   enable = true;
  # };


  # services.whoogle-search = {
  #   enable = true;
  # };


  # services.wivrn = {
  #   enable = true;
  #   openFirewall = true;

  #   # Write information to /etc/xdg/openxr/1/active_runtime.json, VR applications
  #   # will automatically read this and work with WiVRn (Note: This does not currently
  #   # apply for games run in Valve's Proton)
  #   defaultRuntime = true;

  #   # Run WiVRn as a systemd service on startup
  #   autoStart = true;

  #   # Config for WiVRn (https://github.com/WiVRn/WiVRn/blob/master/docs/configuration.md)
  #   config = {
  #     enable = true;
  #     json = {
  #       # 1.0x foveation scaling
  #       scale = 1.0;
  #       # 100 Mb/s
  #       bitrate = 100000000;
  #       encoders = [
  #         {
  #           encoder = "vaapi";
  #           codec = "h265";
  #           # 1.0 x 1.0 scaling
  #           width = 1.0;
  #           height = 1.0;
  #           offset_x = 0.0;
  #           offset_y = 0.0;
  #         }
  #       ];
  #     };
  #   };
  # };



}
