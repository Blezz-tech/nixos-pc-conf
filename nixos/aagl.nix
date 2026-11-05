{ ... }: {
  programs.anime-games-launcher = {
    # Enable launcher.
    enable = true;

    # Optional API configuration. Presented values are
    # set by default.
    api = {
      sqlite = true;
      protobuf = true;
      torrent = true;
      portal = true;
      secrets = true;
    };

    # Enable launcher packages debugging tool called anirun.
    anirun = {
      enable = true;

      # Optional API configuration. Presented values are
      # set by default.
      api = {
        sqlite = true;
        protobuf = true;
        torrent = true;
        portal = true;
        secrets = true;
      };
    };
  };
}
