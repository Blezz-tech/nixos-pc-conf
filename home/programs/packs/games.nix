{ pkgs
, ...
}: {
  home.packages = [
    ## wine & proton
    pkgs.protonup-qt

    ## Лаунчеры

    # pkgs.nexusmods-app-unfree
    pkgs.ryubing
    pkgs.prismlauncher
    pkgs.shadps4
    (pkgs.bottles.override { removeWarningPopup = true; })
    pkgs.r2modman
    pkgs.lutris
    pkgs.ftb-app
    # pkgs.itch

    ## Мод манагеры

    # pkgs.limo

    ## Игры

    # Герои меча и магии
    pkgs.vcmi
    # pkgs.fheroes2
    pkgs.vangers

    # pkgs.openxray
    # pkgs.arx-libertatis
    # pkgs.opengothic
    # pkgs.cataclysm-dda
    # pkgs.ruffle
    # pkgs.superTuxKart
    # pkgs.cmatrix
    # pkgs.keeperrl
    # pkgs.minetest
    # pkgs.wesnoth
    # pkgs.openspades
    pkgs.airshipper
    pkgs.taisei

    # pkgs.unciv
    # pkgs.endless-sky
    # pkgs.openra
    pkgs.osu-lazer-bin
    # pkgs.the-powder-toy
    # pkgs.crawlTiles
    # pkgs.hedgewars
    # pkgs.tome4
    # pkgs.warzone2100
    # pkgs.tome4
    # pkgs.openspades
    # pkgs.openclonk
    # pkgs.opentyrian
    # pkgs.simutrans
    # pkgs.redeclipse
    # pkgs.openrct2
    # pkgs.openttd
    # pkgs.stuntrally
    # pkgs.neverball
    # pkgs.widelands
    # pkgs.warsow
    # pkgs.urbanterror
    # pkgs.iagno

    ## pixel dungeons

    # pkgs.shorter-pixel-dungeon
    # pkgs.summoning-pixel-dungeon
    # pkgs.experienced-pixel-dungeon
    # pkgs.rat-king-adventure
    # pkgs.rkpd2
    # pkgs.shattered-pixel-dungeon

    # pkgs.kdePackages.kolf
    # pkgs.kdePackages.kmahjongg
    # pkgs.kdePackages.knights
    # pkgs.kdePackages.knavalbattle
    # pkgs.kdePackages.kmines
    # pkgs.kdePackages.picmi
    # pkgs.kdePackages.ksudoku
    # pkgs.kdePackages.kpat

    # pkgs.kdePackages.ksirk
    # pkgs.kdePackages.kajongg
    # pkgs.kdePackages.kwordquiz
  ];
}
