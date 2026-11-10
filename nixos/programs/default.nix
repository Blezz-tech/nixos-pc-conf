{ pkgs
, lib
, ...
}: {
  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };

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

  # chromium
  security.chromiumSuidSandbox.enable = true;

  programs.chromium = {
    enable = true;
    extraOpts = {
      "SpellcheckEnabled" = true;
      "SpellcheckLanguage" = [
        "en-US"
        "ru"
        "zh-CN"
      ];
    };
    enablePlasmaBrowserIntegration = true;
  };

  # firefox
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" "ru" "zh-CN" ];
    wrapperConfig = {
      pipewireSupport = true;
    };
    nativeMessagingHosts = {
      packages = [
        pkgs.kdePackages.plasma-browser-integration
      ];
    };
  };

  # kdeconnect
  programs.kdeconnect = {
    enable = true;
    package = lib.mkDefault pkgs.kdePackages.kdeconnect-kde;
  };

  # obs-studio
  # programs.obs-studio = {
  #   enable = true;
  #   plugins = with pkgs.obs-studio-plugins; [
  #     wlrobs
  #     obs-backgroundremoval
  #     obs-pipewire-audio-capture
  #   ];
  #   # enableVirtualCamera = true;
  # };

  # steam
  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };

    gamemode = {
      enable = true;
      # enableRenice = true;
    };

    steam = {
      enable = true;

      # Proton
      protontricks.enable = true;

      # Enable Game Scope
      # gamescopeSession.enable = true;

      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers

      extraCompatPackages = [
        pkgs.dwproton-bin
      ];
    };
  };
}
