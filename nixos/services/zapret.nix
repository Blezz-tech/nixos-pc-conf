{ pkgs
, ...
}:
# Один из конфигов
# https://github.com/Flowseal/zapret-discord-youtube/discussions/3279#discussioncomment-14616172
let
  zdy = pkgs.blezz-pkgs.zdyPackages."1_8_3";
  zapret = pkgs.blezz-pkgs.zapret;
in
{
  services.zapret = {
    enable = true;
    package = zapret;
    udpSupport = true;
    udpPorts = [
      "443"
      "19294:19344"
      "50000:50100"
      # "0:65535"
    ];
      params = [
        # --wf-tcp=80,443,2053,2083,2087,2096,8443,%GameFilter%
        # --wf-udp=443,19294-19344,50000-50100,%GameFilter%


        "--filter-udp=443"
        "--hostlist=${zdy}/list-general.txt"
        "--dpi-desync=fake"
        "--dpi-desync-repeats=6"
        "--dpi-desync-fake-quic=${zapret}/files/fake/quic_initial_www_google_com.bin"
        "--new"

        "--filter-udp=19294-19344,50000-50100"
        "--filter-l7=discord,stun"
        "--dpi-desync=fake"
        "--dpi-desync-repeats=6"
        "--new"

        "--filter-tcp=80"
        "--hostlist=${zdy}/list-general.txt"
        "--dpi-desync=fake,split2"
        "--dpi-desync-autottl=2"
        "--dpi-desync-fooling=badseq"
        "--dpi-desync-badseq-increment=2"
        "--new"

        "--filter-tcp=2053,2083,2087,2096,8443"
        "--hostlist-domains=discord.media"
        "--dpi-desync=fake"
        "--dpi-desync-fake-tls-mod=none"
        "--dpi-desync-repeats=6"
        "--dpi-desync-fooling=badseq"
        "--dpi-desync-badseq-increment=2"
        "--new"

        "--filter-tcp=443"
        "--hostlist=${zdy}/list-general.txt"
        "--dpi-desync=fake"
        "--dpi-desync-fake-tls-mod=none"
        "--dpi-desync-repeats=6"
        "--dpi-desync-fooling=badseq"
        "--dpi-desync-badseq-increment=2"
        "--new"

        "--filter-udp=443"
        "--ipset=${zdy}/lists/ipset-all.txt"
        "--dpi-desync=fake"
        "--dpi-desync-repeats=6"
        "--dpi-desync-fake-quic=${zapret}/files/fake/quic_initial_www_google_com.bin"
        "--new"

        "--filter-tcp=80"
        "--ipset=${zdy}/lists/ipset-all.txt"
        "--dpi-desync=fake,split2"
        "--dpi-desync-autottl=2"
        "--dpi-desync-fooling=badseq"
        "--dpi-desync-badseq-increment=2"
        "--new"
      ];
  };
}
