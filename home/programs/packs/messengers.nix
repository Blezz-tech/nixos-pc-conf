# Мессенджеры и почта.
{ pkgs, ... }: {
  home.packages = [
    pkgs.discord
    pkgs.discord-canary # отдельный профиль для тестовых сборок Discord
    pkgs.vesktop # Discord на веб-стеке, поддерживает венкорд-плагины
    pkgs.telegram-desktop

    pkgs.thunderbird # почта
  ];
}
