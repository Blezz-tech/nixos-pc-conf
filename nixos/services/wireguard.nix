{ pkgs
, ...
}: {
  networking.firewall = {
    allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  };
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.8.0.90/24" ];
      dns = [ "1.1.1.1" ];
      privateKeyFile = "/run/media/jenya/disk_d/vpn/vpn.PrivateKey";

      peers = [
        {
          publicKey = "bxG0yI+ML7ljhzFSoH/kp72tv8fukFAx23HXpD2nA00=";
          presharedKeyFile = "/run/media/jenya/disk_d/vpn/vpn.PresharedKey";
          allowedIPs = [ "0.0.0.0/0" "::/0" ];
          endpoint = "217.25.95.90:51820";
          persistentKeepalive = 0;
        }
      ];
    };
  };
  environment.systemPackages = [ pkgs.nmap ];
}
