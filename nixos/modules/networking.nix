{
  hostName,
  ...
}:
{
  networking = {
    firewall = {
      enable = true;

      # Порты syncthing. Сам сервис настроен в home-manager
      # (home/programs/syncthing.nix): у home-manager нет опции openDefaultPorts,
      # поэтому порты открываются здесь, иначе синхронизация пойдёт только через
      # реле. 22000/tcp+udp — обмен с устройствами, 21027/udp — обнаружение в сети.
      allowedTCPPorts = [ 22000 ];
      allowedUDPPorts = [
        22000
        21027
      ];
    };

    networkmanager.enable = true;
    # nftables.enable = true;
    inherit hostName;
  };
  networking.extraHosts = ''
    127.0.0.1 mc.yandex.ru
  '';
  # Полный список доменов Яндекс-рекламы для блокировки через extraHosts —
  # в docs/notes/reference.md, раздел «Блокировка доменов».
}
