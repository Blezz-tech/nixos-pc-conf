{ pkgs
, ...
}:
# Используется конфиг zarpet-youtube-discord general (Dronatar)/general (ALT6)
# https://github.com/Flowseal/zapret-discord-youtube/discussions/3279
let
  zdy = pkgs.blezz-pkgs.zdyPackages."1_9_7";
  zapret = pkgs.blezz-pkgs.zapret;
in
{
  services.zapret = {
    enable = true;
    package = zapret;
    udpSupport = true;
    udpPorts = [
      "443"
      "1400"
      "19294:19344"
      "50000:50032"
      # "0:65535"
    ];
    params = [
      "--filter-udp=443"
      "--hostlist=${zdy}/lists/list-general.txt"
      "--hostlist-exclude=${zdy}/lists/list-exclude.txt"
      "--ipset-exclude=${zdy}/lists/ipset-exclude.txt"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=6"
      "--dpi-desync-fake-quic=${zdy}/bin/quic_initial_www_google_com.bin"
      "--new"
      "--filter-udp=19294-19344,50000-50100"
      "--filter-l7=discord,stun"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=6"
      "--new"
      "--filter-tcp=2053,2083,2087,2096,8443"
      "--hostlist-domains=discord.media"
      "--dpi-desync=fake,hostfakesplit"
      "--dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com"
      "--dpi-desync-hostfakesplit-mod=host=www.google.com,altorder=1"
      "--dpi-desync-fooling=ts"
      "--new"
      "--filter-tcp=443"
      "--hostlist=${zdy}/lists/list-google.txt"
      "--ip-id=zero"
      "--dpi-desync=fake,hostfakesplit"
      "--dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com"
      "--dpi-desync-hostfakesplit-mod=host=www.google.com,altorder=1"
      "--dpi-desync-fooling=ts"
      "--new"
      "--filter-tcp=80,443"
      "--hostlist=${zdy}/lists/list-general.txt"
      "--hostlist-exclude=${zdy}/lists/list-exclude.txt"
      "--ipset-exclude=${zdy}/lists/ipset-exclude.txt"
      "--dpi-desync=fake,hostfakesplit"
      "--dpi-desync-fake-tls-mod=rnd,dupsid,sni=ya.ru"
      "--dpi-desync-hostfakesplit-mod=host=ya.ru,altorder=1"
      "--dpi-desync-fooling=ts"
      "--dpi-desync-fake-http=${zdy}/bin/tls_clienthello_max_ru.bin"
      "--new"
      "--filter-udp=443"
      "--ipset=${zdy}/lists/ipset-all.txt"
      "--hostlist-exclude=${zdy}/lists/list-exclude.txt"
      "--ipset-exclude=${zdy}/lists/ipset-exclude.txt"
      "--dpi-desync=fake"
      "--dpi-desync-repeats=6"
      "--dpi-desync-fake-quic=${zdy}/bin/quic_initial_www_google_com.bin"
      "--new"
      "--filter-tcp=80,443,8443"
      "--ipset=${zdy}/lists/ipset-all.txt"
      "--hostlist-exclude=${zdy}/lists/list-exclude.txt"
      "--ipset-exclude=${zdy}/lists/ipset-exclude.txt"
      "--dpi-desync=fake,hostfakesplit"
      "--dpi-desync-fake-tls-mod=rnd,dupsid,sni=ya.ru"
      "--dpi-desync-hostfakesplit-mod=host=ya.ru,altorder=1"
      "--dpi-desync-fooling=ts"
      "--dpi-desync-fake-http=${zdy}/bin/tls_clienthello_max_ru.bin"
      "--new"
      # "--filter-tcp=%GameFilterTCP%"
      # "--ipset=${zdy}/lists/ipset-all.txt"
      # "--ipset-exclude=${zdy}/lists/ipset-exclude.txt"
      # "--dpi-desync=fake,hostfakesplit"
      # "--dpi-desync-any-protocol=1"
      # "--dpi-desync-cutoff=n4"
      # "--dpi-desync-fake-tls-mod=rnd,dupsid,sni=ya.ru"
      # "--dpi-desync-hostfakesplit-mod=host=ya.ru,altorder=1"
      # "--dpi-desync-fooling=ts"
      # "--dpi-desync-fake-http=${zdy}/bin/tls_clienthello_max_ru.bin"
      # "--new"
      # "--filter-udp=%GameFilterUDP%"
      # "--ipset=${zdy}/lists/ipset-all.txt"
      # "--ipset-exclude=${zdy}/lists/ipset-exclude.txt"
      # "--dpi-desync=fake"
      # "--dpi-desync-repeats=10"
      # "--dpi-desync-any-protocol=1"
      # "--dpi-desync-fake-unknown-udp=${zdy}/bin/quic_initial_www_google_com.bin"
      # "--dpi-desync-cutoff=n4"

    ];
  };
}
