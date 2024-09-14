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
    stateVersion = "23.11";
  };

  nixpkgs.config.allowUnfree = true;

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
