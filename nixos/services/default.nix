# Сервисы NixOS. Подключение — автоматическое, как и в nixos/modules.
{ libx, ... }:
{
  imports = libx.allModules ./.;
}
