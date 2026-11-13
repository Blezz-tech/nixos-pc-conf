{ pkgs, ... }:
{
  home.packages = [
    pkgs.google-chrome
    pkgs.tor-browser
    pkgs.vivaldi
  ];
}