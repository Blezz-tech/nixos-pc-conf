# Программы NixOS, которые включаются опциями. Подключение — автоматическое,
# как и в nixos/modules.
{ libx, ... }:
{
  imports = libx.allModules ./.;
}
