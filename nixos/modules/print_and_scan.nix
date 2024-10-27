{ pkgs
, ...
}: {
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    drivers = [ pkgs.samsung-unified-linux-driver ];
    # openFirewall = true;
    # defaultShared = true;
  };

  # services.avahi = {
  #   enable = true;
  #   nssmdns4 = true;
  #   openFirewall = true;
  #   publish = {
  #     enable = true;
  #     userServices = true;
  #   };
  # };

  # Сканирование документов
  hardware.sane.enable = true;

  environment.systemPackages = [
    pkgs.kdePackages.skanpage
    pkgs.naps2
  ];
}
