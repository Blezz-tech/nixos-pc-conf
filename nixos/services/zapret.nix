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
        "--dpi-desync-repeats=6"
        "--new"
        "--filter-tcp=443"
        "--dpi-desync=fake,multidisorder"
        "--dpi-desync-split-pos=midsld"
        "--dpi-desync-repeats=6"
        "--dpi-desync-fooling=md5sig,badseq"
        "--new"
        "--filter-tcp=80"
        "--dpi-desync=fake,split2"
        "--dpi-desync-autottl=2"
        "--dpi-desync-fooling=md5sig"
    ];
  };
}
