{
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };

    gamemode.enable = true;

    steam = {
      enable = true;

      # Enable Game Scope
      # gamescopeSession.enable = true;

      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
  };
}
