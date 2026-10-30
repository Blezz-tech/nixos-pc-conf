{ pkgs, ... }:
{
  home.packages = [
    pkgs.google-chrome
    pkgs.tor-browser
    pkgs.vivaldi
    # pkgs.yandex-browser-corporate
    # pkgs.brave
  ];
}