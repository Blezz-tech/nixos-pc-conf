{ pkgs
, lib
, ...
}: {
  fonts.packages = [
    # Шрифты paratype
    pkgs.paratype-pt-sans
    pkgs.paratype-pt-mono
    pkgs.paratype-pt-serif

    # Шрифты terminus
    pkgs.terminus_font

    # Шрифты noto
    pkgs.noto-fonts
    pkgs.noto-fonts-lgc-plus
    pkgs.noto-fonts-cjk-serif
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-color-emoji
    pkgs.noto-fonts-extra

    # Шрифты windows
    pkgs.corefonts
    pkgs.vistafonts

    # Mono
    pkgs.hack-font

    # Остальные
    pkgs.ibm-plex

    pkgs.source-han-sans
    pkgs.font-awesome
    pkgs.source-code-pro
    pkgs.source-sans
    pkgs.source-sans-pro
    pkgs.liberation_ttf
    pkgs.scientifica
    pkgs.sarasa-gothic
    
    pkgs.roboto

    # A (mainly) Chinese Unicode font
    pkgs.wqy_microhei

    # other
    pkgs.lmodern
  ] ++ (builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts));
}
