{
  networking.firewall = {
    allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  };
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.8.0.82/24" ];
      dns = [ "1.1.1.1" ];
      privateKeyFile = "/run/media/jenya/disk_d/vpn/SHOHOV.PrivateKey";
      
      peers = [
        {
          publicKey = "0fhXUeR2Z1XiaNNvtOT40jZzDJs9FJstr7J+3lRcHTU=";
          presharedKeyFile = "/run/media/jenya/disk_d/vpn/SHOHOV.PresharedKey";
          allowedIPs = [ "0.0.0.0/0" "::/0" ];
          endpoint = "95.140.159.78:51820";
          persistentKeepalive = 0;
        }
      ];
    };
  };
}