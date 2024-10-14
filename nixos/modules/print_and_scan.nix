{ pkgs
, ...
}: {
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.samsung-unified-linux-driver ];

  # Сканирование документов
  hardware.sane.enable = true;

  environment.systemPackages = [
    pkgs.kdePackages.skanpage
    pkgs.naps2
  ];
}
