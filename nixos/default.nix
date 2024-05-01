{ pkgs
, ...
}:
{
  imports = [
    ./modules
    ./hardware-configuration.nix
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.config.permittedInsecurePackages = [
    "nix-2.16.2" # for nixd
  ];

  nixpkgs.config.allowUnfree = true;

  virtualisation.waydroid.enable = true;
  


  # amd utils
  programs.corectrl.enable = false;

  networking.hostName = "nixos-jenya";

  time.timeZone = "Europe/Moscow";

  i18n = {
    supportedLocales = [ "all" ];
    defaultLocale = "ru_RU.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "ru_RU.UTF-8";
      LC_IDENTIFICATION = "ru_RU.UTF-8";
      LC_MEASUREMENT = "ru_RU.UTF-8";
      LC_MONETARY = "ru_RU.UTF-8";
      LC_NAME = "ru_RU.UTF-8";
      LC_NUMERIC = "ru_RU.UTF-8";
      LC_PAPER = "ru_RU.UTF-8";
      LC_TELEPHONE = "ru_RU.UTF-8";
      LC_TIME = "ru_RU.UTF-8";
    };
  };

  # xdg_open should work in steam_run this way… well it’s not 
  # https://github.com/NixOS/nixpkgs/issues/160923
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];

    desktopManager.plasma5.enable = true;

    # Configure keymap in X11
    xkb.layout = "us,ru";
    xkb.variant = "";
  };

  services.displayManager = {
    sddm.enable = true;
    # defaultSession = "plasmawayland";
    autoLogin = {
      enable = true;
      user = "jenya";
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # libinput.enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  users.users.jenya = {
    isNormalUser = true;
    description = "jenya";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "libvirtd"
      # "corectrl"
    ];
    packages = [
      (pkgs.callPackage ./gt-vein-info { })
    ];
  };

  # Чтобы не было ошибок
  programs.dconf.enable = true;

  programs.partition-manager.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  environment.systemPackages = with pkgs; [
    xdg_utils
    git
    wget
    curl
    firefox
    vscode
    pwgen
    keepassxc

    home-manager

    steam-run
    lutris

    # Аудио видео проигрыватели
    vlc

    # Диспеер раздеов дисков
    partition-manager
  ];

  fonts.packages = with pkgs; [
    # Шрифты paratype
    paratype-pt-sans
    paratype-pt-mono
    paratype-pt-serif

    # Шрифты terminus
    terminus_font

    # Шрифты noto
    noto-fonts
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    noto-fonts-emoji

    # Шрифты windows
    corefonts
    vistafonts

    # Mono
    hack-font
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };

  system.stateVersion = "23.11";

}
