# Пакеты из своего оверлея blezz-pkgs (см. nixos/overlays.nix).
{ pkgs, ... }: {
  home.packages = [
    pkgs.blezz-pkgs.discord-krisp-patcher
    pkgs.blezz-pkgs.tg-ws-proxy # Telegram через WebSocket-прокси
  ];
}
