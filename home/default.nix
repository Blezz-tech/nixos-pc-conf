{ inputs
, ...
}:
{
  imports = [
    ./plasma-manager
    ./programs
    ./shell
    ./wm
    ./XDG
    # ./fcitx5
    # ./i3
    # ./rofi

    # Other
    inputs.plasma-manager.homeManagerModules.plasma-manager
  ];

  home = {
    username = "jenya";
    homeDirectory = "/home/jenya";
    stateVersion = "23.11";
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
