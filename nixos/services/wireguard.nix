{ pkgs
, ...
}: {
  networking.firewall = {
    allowedUDPPorts = [ 51820 ]; # Clients and peers can use the same port, see listenport
  };
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.8.0.2/24" ];
      dns = [ "1.1.1.1" ];
      mtu = 1332;
      privateKeyFile = "/run/media/jenya/disk_d/vpn/SHOHOV.PrivateKey";
      preUp = "ping --udp --count 1 --data-length 16 --source-port 2916 --dest-port 2916 195.58.38.51";

      peers = [
        {
          publicKey = "XEfBvGbnuBZ1vORNW65kjGScCX9UWmC6NF+Cjkmp5A0=";
          presharedKeyFile = "/run/media/jenya/disk_d/vpn/SHOHOV.PresharedKey";
          allowedIPs = [ "0.0.0.0/0" "::/0" ];
          endpoint = "195.58.38.51:2916";
          persistentKeepalive = 25;
        }
      ];
    };
  };
  environment.systemPackages = [ pkgs.nmap ];
}
