# v2rayN — GUI-клиент, а движки и списки GeoIP он ищет файлами рядом со своими
# данными, а не в $PATH. Сам пакет v2rayn ставится в common.nix; здесь только
# раскладка бинарей и датасетов в ~/.local/share/v2rayN/bin.
#
# xdg.dataFile (а не configFile): v2rayN хранит настройки и движки в
# XDG_DATA_HOME, ~/.config он не использует.
{ pkgs, ... }: {
  xdg.dataFile = {
    "v2rayN/bin/sing_box/sing-box".source = "${pkgs.sing-box}/bin/sing-box";
    "v2rayN/bin/xray/xray".source = "${pkgs.xray}/bin/xray";
    "v2rayN/bin/geoip.dat".source = "${pkgs.v2ray-geoip}/share/v2ray/geoip.dat";
    "v2rayN/bin/geosite.dat".source = "${pkgs.v2ray-domain-list-community}/share/v2ray/geosite.dat";
  };
}
