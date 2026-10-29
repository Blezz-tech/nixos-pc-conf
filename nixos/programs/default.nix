{
  imports = [
    ./chromium.nix
    ./firefox.nix
    ./kdeconnect.nix
    ./obs-studio.nix
    ./steam.nix
  ];

  # programs.throne = {
  #   enable = true;
  #   tunMode.enable = true;
  # };

  # programs.zoom-us.enable = true;

  # Чтобы не было ошибок
  programs.dconf.enable = true;

  # Менеджер разделов
  programs.partition-manager.enable = true;

  # Для ГПУ AMD 
  programs.corectrl.enable = true;

  # nix helper
  programs.nh.enable = true;
  programs.nh.flake = "/home/jenya/nixos-pc-conf/";

  # akonadi services disabled
  programs.kde-pim = {
    enable = false;
    kmail = false;
    merkuro = false;
    kontact = false;
  };

  # appimage-run
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # openvpn client
  # programs.openvpn3.enable = true;

  # plasma-systemmonitor
  programs.plasma-systemmonitor.enable = true;
}
