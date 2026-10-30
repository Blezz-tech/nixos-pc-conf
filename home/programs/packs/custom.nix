{ pkgs, ... }:
{
  home.packages = [
    pkgs.blezz-pkgs.discord-krisp-patcher
    pkgs.blezz-pkgs.tg-ws-proxy
    # pkgs.blezz-pkgs.davinci-resolve
    # pkgs.blezz-pkgs.MURMUR.CLION.v2025_2_2
  ];
}