{ pkgs, ... }: {
  systemd.services.spoofdpi = {
    enable = true;
    description = "Spoof DPI Service";
    unitConfig = {
      Type = "simple";
    };
    serviceConfig = {
      ExecStart = "${pkgs.spoofdpi}/bin/spoofdpi --port 3999";
      Restart = "always";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
