{
  imports = [
    ./fonts.nix
    ./i18n.nix
    ./nix-ld.nix
    ./nix.nix
    ./openssh.nix
    ./opentablet.nix
    ./podman.nix
    # ./print_and_scan.nix
    ./sound.nix
    ./tty.nix
    ./user.nix
    ./vr.nix
    ./xserver.nix
    ./work
  ];

  # bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Чтобы не было ошибок
  programs.dconf.enable = true;

  # Менеджер разделов
  programs.partition-manager.enable = true;

  # Сетевой менеждер
  networking.firewall.enable = true;
  networking.networkmanager.enable = true;
  # networking.nftables.enable = true;
  networking.extraHosts = ''
    0.0.0.0 advertising.yandex.ru

    0.0.0.0 www.advertising.yandex.ru

    0.0.0.0 audience.yandex.ru

    0.0.0.0 www.audience.yandex.ru

    0.0.0.0 direct.yandex.ru

    0.0.0.0 www.direct.yandex.ru

    0.0.0.0 metrika.yandex.ru

    0.0.0.0 www.metrika.yandex.ru

    0.0.0.0 partner.yandex.ru

    0.0.0.0 www.partner.yandex.ru

    0.0.0.0 yandexdatafactory.com

    0.0.0.0 www.yandexdatafactory.com

    0.0.0.0 partner.yandex.ua

    0.0.0.0 www.partner.yandex.ua

    0.0.0.0 metrika.yandex.ua

    0.0.0.0 www.metrika.yandex.ua

    0.0.0.0 metrica.yandex.com

    0.0.0.0 www.metrica.yandex.com

    0.0.0.0 metrica.yandex.ru

    0.0.0.0 www.metrica.yandex.ru

    # 0.0.0.0 yastatic.net

    # 0.0.0.0 www.yastatic.net

    0.0.0.0 clck.yandex.ru

    0.0.0.0 www.clck.yandex.ru

    0.0.0.0 mc.yandex.ru

    0.0.0.0 www.mc.yandex.ru

    0.0.0.0 yabs.yandex.ru

    0.0.0.0 www.yabs.yandex.ru

    0.0.0.0 yabs.yandex.ua

    0.0.0.0 www.yabs.yandex.ua

    0.0.0.0 an.yandex.ru

    0.0.0.0 www.an.yandex.ru

    0.0.0.0 an.yandex.ua

    0.0.0.0 www.an.yandex.ua

    0.0.0.0 3ds.money.yandex.ru

    0.0.0.0 abo.market.yandex.ru

    0.0.0.0 bs.yandex.ru

    0.0.0.0 click.yandex.ru

    0.0.0.0 mc.yandex.ru

    # 0.0.0.0 market-click2.yandex.ru

    0.0.0.0 partner.market.yandex.ru

    0.0.0.0 www.adv.yandex.ru

    0.0.0.0 yandex-question.naydex.net

    0.0.0.0 naydex.net

    0.0.0.0 yandexadexchange.net
  '';

  # Переменные окружения
  environment.variables.EDITOR = "nvim";
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # wayland для electron приложений

  # Для ГПУ AMD 
  programs.corectrl.enable = true;

  # Менеджер виртуальный машин
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Эмулятор Android
  # virtualisation.waydroid.enable = true;

  # nix helper
  programs.nh.enable = true;
  programs.nh.flake = "/home/jenya/nixos-pc-conf/";

  # nixpkgs settings
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ ];
  # nixpkgs.config.rocmSupport = true;

  # kmail
  # programs.kde-pim = {
  #   # kmail = true;
  #   kontact = true;
  #   merkuro = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # libinput.enable = true;

  # appimage-run
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # openvpn client
  # programs.openvpn3.enable = true;

  # MIME TYPE
  # xdg.mime.enable = true;
  # xdg.mime.addedAssociations = {
  #   "application/drawio" = "drawio.desktop";
  # };
}
