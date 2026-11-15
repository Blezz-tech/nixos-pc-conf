# Хосты. Имя атрибута — это одновременно имя конфигурации во флейке
# (nixosConfigurations.<имя>) и networking.hostName.
#
# Пока хост один. Второй добавляется одной строкой здесь, без правок flake.nix.
{
  nixos-jenya = {
    system = "x86_64-linux";
    username = "jenya";
  };
}
