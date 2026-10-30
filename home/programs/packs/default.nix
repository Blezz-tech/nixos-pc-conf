{
  imports = [
    ./archive.nix
    ./browsers.nix
    ./custom.nix
    ./dev.nix
    ./games.nix
    ./kde.nix
    ./media.nix
    ./messengers.nix
    ./office.nix
    ./tex.nix
  ];

  programs = {
    bun.enable = true;
    java.enable = true;
    fastfetch.enable = true;
    freetube.enable = true;
    pandoc.enable = true;
    yt-dlp.enable = true;
  };
}
