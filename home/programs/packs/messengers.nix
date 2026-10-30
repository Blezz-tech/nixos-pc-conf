{ pkgs, ... }:
{
  home.packages = [
    pkgs.discord-canary
    pkgs.telegram-desktop
    pkgs.vesktop
    # pkgs.element-desktop
    # pkgs.discord-screenaudio
    # pkgs.webcord-vencord
    # pkgs.nheko
    # pkgs.fractal
    # pkgs.revolt-desktop
    pkgs.thunderbird
  ];
}