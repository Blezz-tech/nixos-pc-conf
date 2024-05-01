{
  imports = [
    ./programs
    ./shell
    ./XDG
    # ./fcitx5
    # ./i3
    # ./rofi
  ];

  home = {
    username = "jenya";
    homeDirectory = "/home/jenya";
    stateVersion = "23.11";
  };
  
  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
