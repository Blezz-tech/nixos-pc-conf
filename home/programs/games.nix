{ pkgs
, ...
}: {
  home.packages = with pkgs; [
    # Игры
    
    prismlauncher
    cataclysm-dda
    # cmatrix
    # keeperrl
    # minetest
    # wesnoth
    # openspades
    # airshipper

    # unciv
    # endless-sky
    # openra
    # osu-lazer
    # the-powder-toy
    # crawlTiles
    # hedgewars
    # tome4
    # warzone2100
    # tome4
    # openspades
    # openclonk
    # opentyrian
    # simutrans
    # redeclipse
    # openrct2
    # openttd
    # stuntrally
    # neverball
    # widelands
    # warsow
    # urbanterror
    ## pixel dungeons
    # shorter-pixel-dungeon
    # summoning-pixel-dungeon
    # experienced-pixel-dungeon
    # rat-king-adventure
    # rkpd2
    # shattered-pixel-dungeon

    # kdePackages.kolf
    # kdePackages.kmahjongg
    # kdePackages.knights
    # kdePackages.knavalbattle
    # kdePackages.kmines
    # kdePackages.picmi
    # kdePackages.ksudoku
    # kdePackages.kpat

    # kdePackages.ksirk
    # kdePackages.kajongg
    # kdePackages.kwordquiz
  ];
}
