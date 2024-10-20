{ pkgs
, lib
, ...
}:
{
  services.zapret = {
    enable = true;
    package = pkgs.zapret-latest;
    params = lib.strings.splitString "\n" ''
      --wf-tcp=443
      --wf-udp=443,50000-50100
      --filter-udp=443
      --hostlist="list-discord.txt"
      --dpi-desync=fake --dpi-desync-repeats=6
      --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin"
      --new
      --filter-udp=50000-50100
      --ipset="ipset-discord.txt"
      --dpi-desync=fake
      --dpi-desync-any-protocol
      --dpi-desync-cutoff=d3
      --dpi-desync-repeats=6
      --new
      --filter-tcp=443
      --hostlist="list-discord.txt"
      --dpi-desync=fake,split
      --dpi-desync-autottl=2
      --dpi-desync-repeats=6
      --dpi-desync-fooling=badseq
      --dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin"
    '';
  };
}
