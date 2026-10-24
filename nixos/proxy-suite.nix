{
  services.proxy-suite = {
    enable = true;
    zapret = {
      enable = true;
      zapret-discord-youtube = {
        configName = "general(ALT11)"; # the default; try others if it does not work
        domains = [
          "rutracker.org"
        ]; # more sites to unblock
      };
    };
  };
}
