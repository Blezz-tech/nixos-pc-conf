{ pkgs
, ...
}: {
  services.tor = {
    enable = true;
    enableGeoIP = false;
    client.enable = true;
    client.dns.enable = true;
    settings = {
      ExcludeExitNodes = "{RU},{UA},{BY},{KZ}";
      UseBridges = true;
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      Bridge = ''
        obfs4 51.91.145.55:43695 FC16ACBD3DF13A99728892818ADAD0E0B24B9651 cert=OFqWfnJddrEZivZjzuaru55TPyOPyvaE/Z4msTd3lNg7WY/PwzbrPJB4cVjfg4kMlSORYw iat-mode=0
      '';
    };
  };
}
