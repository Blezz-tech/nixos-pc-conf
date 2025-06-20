{ pkgs
, ...
}:
let
  zdy = (pkgs.blezz-pkgs.zapret-discord-youtube.overrideAttrs (oldAttrs: {
    version = "1.7.2b";
  }));
  zapret = pkgs.blezz-pkgs.zapret;
in
{
  services.zapret = {
    enable = true;
    package = zapret;
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
      "--dpi-desync-fake-quic=${zapret}/files/fake/quic_initial_www_google_com.bin"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=2"
      "--new"
      "--filter-tcp=80,443"
      "--dpi-desync=fake,multidisorder"
      "--dpi-desync-ttl=3"
    ];
  };
}
