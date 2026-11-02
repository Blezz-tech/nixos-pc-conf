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
    keepassxc = {
      enable = true;
      autostart = true;
    };
  };

  services.syncthing = {
    enable = true;
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "pc-nixos-jenya" = { id = "343V63H-VVN5ALI-JMVIYP4-B7QIGHL-UVMDCYJ-P3IQ2RU-NUDFBSW-RX3UOAA"; };
        "poco-x3-pro" = { id = "RU33CWR-HPTNESJ-6DELDQQ-FZ2ERPA-W3TYRJH-N64ELRJ-YXUFKG6-ABSHRAX"; };
      };
      folders = {
        "/home/jenya/media/documents/" = {
          id = "5jyjs-qxyvz";
          label = "документы";
          devices = [ "poco-x3-pro" ];
          versioning = {
            type = "simple";
            params.keep = "50";
          };
        };
      };
    };
  };

}
