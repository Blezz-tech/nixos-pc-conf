{ pkgs
, ...
}: {
  services.zapret = {
    enable = true;
    package = pkgs.blezz-pkgs.zapret;
    udpSupport = true;
    udpPorts = [
      "50000:50099"
      "443"
    ];
    # Если не будет работать, то попробовать исполдьзовать конфиг из https://github.com/Flowseal/zapret-discord-youtube
    params = [
        "--filter-udp=50000-50099"
        "--dpi-desync=fake"
        "--dpi-desync-any-protocol"
        "--new"
        "--filter-udp=443"
        "--dpi-desync-fake-quic=${pkgs.blezz-pkgs.zapret}/files/fake/quic_initial_www_google_com.bin"
        "--dpi-desync=fake"
        "--dpi-desync-repeats=2"
        "--new"
        "--filter-tcp=80,443"
        "--dpi-desync=fake,multidisorder"
        "--dpi-desync-ttl=3"
    ];
  };
}
