{ pkgs
, ...
}: {

  home.packages = with pkgs.kdePackages; [
    # pkgs.kdePackages.kolourpaint
    pkgs.kdePackages.kleopatra
    # pkgs.kdePackages.kasts
    pkgs.kdePackages.kcalc
    pkgs.kdePackages.kclock
    # pkgs.kdePackages.juk
    # pkgs.kdePackages.kalzium
    # pkgs.kdePackages.kfind
    # pkgs.kdePackages.ksystemlog
    pkgs.kdePackages.kjournald
    # pkgs.kdePackages.kio-gdrive
    # pkgs.kdePackages.kcharselect
    pkgs.kdePackages.kompare
    (pkgs.kdePackages.spectacle.override { tesseractLanguages = null; })
    # pkgs.kdePackages.wallpaper-engine-plugin
    # pkgs.kdePackages.neochat
    pkgs.kdePackages.filelight # For Dolphin Integration
    pkgs.kdePackages.kdialog # Для arx libertatis
    # pkgs.kdePackages.kdenlive
  ];
}