{
  imports = [
    ./chromium.nix
    ./firefox.nix
    # ./hyprland.nix
    ./kdeconnect.nix
    ./nixvim
    # ./nvf.nix
    ./obs-studio.nix
    ./steam.nix
  ];

  programs.zoom-us.enable = true;

  # Чтобы не было ошибок
  programs.dconf.enable = true;

  # Менеджер разделов
  programs.partition-manager.enable = true;

  # Для ГПУ AMD 
  programs.corectrl.enable = true;

  # nix helper
  programs.nh.enable = true;
  programs.nh.flake = "/home/jenya/nixos-pc-conf/";

  # kmail
  # programs.kde-pim = {
  #   # kmail = true;
  #   kontact = true;
  #   merkuro = true;
  # };

  # appimage-run
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  # openvpn client
  # programs.openvpn3.enable = true;
}