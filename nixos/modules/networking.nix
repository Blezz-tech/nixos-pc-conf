{
  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
    # nftables.enable = true;
    hostName = "nixos-jenya";
  };
  networking.extraHosts = ''
    mc.yandex.ru 127.0.0.1
  '';
  # networking.extraHosts = ''
  #   0.0.0.0 advertising.yandex.ru

  #   0.0.0.0 www.advertising.yandex.ru

  #   0.0.0.0 audience.yandex.ru

  #   0.0.0.0 www.audience.yandex.ru

  #   0.0.0.0 direct.yandex.ru

  #   0.0.0.0 www.direct.yandex.ru

  #   0.0.0.0 metrika.yandex.ru

  #   0.0.0.0 www.metrika.yandex.ru

  #   0.0.0.0 partner.yandex.ru

  #   0.0.0.0 www.partner.yandex.ru

  #   0.0.0.0 yandexdatafactory.com

  #   0.0.0.0 www.yandexdatafactory.com

  #   0.0.0.0 partner.yandex.ua

  #   0.0.0.0 www.partner.yandex.ua

  #   0.0.0.0 metrika.yandex.ua

  #   0.0.0.0 www.metrika.yandex.ua

  #   0.0.0.0 metrica.yandex.com

  #   0.0.0.0 www.metrica.yandex.com

  #   0.0.0.0 metrica.yandex.ru

  #   0.0.0.0 www.metrica.yandex.ru

  #   # 0.0.0.0 yastatic.net

  #   # 0.0.0.0 www.yastatic.net

  #   0.0.0.0 clck.yandex.ru

  #   0.0.0.0 www.clck.yandex.ru

  #   0.0.0.0 mc.yandex.ru

  #   0.0.0.0 www.mc.yandex.ru

  #   0.0.0.0 yabs.yandex.ru

  #   0.0.0.0 www.yabs.yandex.ru

  #   0.0.0.0 yabs.yandex.ua

  #   0.0.0.0 www.yabs.yandex.ua

  #   0.0.0.0 an.yandex.ru

  #   0.0.0.0 www.an.yandex.ru

  #   0.0.0.0 an.yandex.ua

  #   0.0.0.0 www.an.yandex.ua

  #   0.0.0.0 3ds.money.yandex.ru

  #   0.0.0.0 abo.market.yandex.ru

  #   0.0.0.0 bs.yandex.ru

  #   0.0.0.0 click.yandex.ru

  #   0.0.0.0 mc.yandex.ru

  #   # 0.0.0.0 market-click2.yandex.ru

  #   0.0.0.0 partner.market.yandex.ru

  #   0.0.0.0 www.adv.yandex.ru

  #   0.0.0.0 yandex-question.naydex.net

  #   0.0.0.0 naydex.net

  #   0.0.0.0 yandexadexchange.net
  # '';
}
