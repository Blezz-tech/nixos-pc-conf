# Игры и лаунчеры. Сам Steam ставится модулем NixOS (nixos/programs/steam.nix).
{ pkgs, ... }: {
  home.packages = [
    ## Wine и Proton
    pkgs.protonup-qt # установка Proton-GE и патчей в Steam
    pkgs.bottles # графический менеджер wine-префиксов

    ## Лаунчеры
    pkgs.prismlauncher # Minecraft
    pkgs.ftb-app # модпаки Feed The Beast
    pkgs.r2modman # моды Risk of Rain 2
  ];
}
