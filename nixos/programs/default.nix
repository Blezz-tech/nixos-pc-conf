{
  imports = [
    ./chromium.nix
    ./firefox.nix
    ./kdeconnect.nix
    ./nixvim.nix
    # ./nvf.nix
    ./obs-studio.nix
    ./steam.nix
  ];

  programs.zoom-us.enable = true;
}