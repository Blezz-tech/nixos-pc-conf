# Оверлеи nixpkgs, по файлу на тему. Подключаются явно: порядок здесь важен
# (прismlauncher правит пакет, который blezz-pkgs не трогает, но так виднее).
{ username, ... }:
{
  nixpkgs.overlays = [
    (import ./blezz-pkgs.nix { inherit username; })
    (import ./prismlauncher.nix)
  ];
}
