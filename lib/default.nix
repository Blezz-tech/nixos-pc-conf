# Обвязка хоста и мелкие помощники для модулей.
# flake.nix должен быть оглавлением (входы → хосты → выходы), а как именно
# собирается NixOS-конфигурация — дело этого файла.
{ inputs }:

let
  lib = inputs.nixpkgs.lib;

  libx = {
    # Рекурсивно собирает все .nix-файлы каталога, кроме default.nix.
    # Заменяет ручные оглавления: добавил файл рядом — он подключён,
    # забыть дописать строку в список невозможно.
    allModules =
      dir:
      let
        entries = builtins.readDir dir;
        collect =
          name:
          let
            type = entries.${name};
            path = dir + "/${name}";
          in
          if type == "directory" then
            libx.allModules path
          else if type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix" then
            [ path ]
          else
            [ ];
      in
      lib.concatMap collect (builtins.attrNames entries);

    # mkHost "nixos-jenya" { username = "jenya"; } → nixosConfiguration
    #
    # name уходит в specialArgs как hostName (его читает
    # nixos/modules/networking.nix) и в users.<name> у home-manager.
    mkHost =
      name:
      {
        system ? "x86_64-linux",
        username,
        modules ? [ ],
      }:
      lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs libx username;
          hostName = name;
        };

        modules = [
          # nixvim.nixosModules.nixvim
          # nvf.nixosModules.default
          # nur.modules.nixos.default
          inputs.proxy-suite.nixosModules.default
          ../nixos
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${username} = import ../home;
              extraSpecialArgs = {
                inherit inputs libx username;
              };
            };
          }
        ]
        ++ modules;
      };
  };
in
libx
