{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true; # Open ports in the firewall for Syncthing. (NOTE: this will not open syncthing gui port)
    settings = {
      devices = {
        # "phone" = { id = ""; };
      };
      folders = {
        "документы" = {
          id = "k4sdh-foo";
          path = "/home/jenya/media/documents/";
          # devices = [ "bigbox" ];
          versioning = {
            type = "simple";
            params.keep = "50";
          };
        };
      };
    };
  };
}
