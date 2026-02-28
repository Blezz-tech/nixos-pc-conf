{ username
, ...
}:
{
  imports = [
    ./programs
    ./shell
    ./XDG
    # ./fcitx5
    # ./i3
    # ./rofi

    # Other
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "26.05";
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
