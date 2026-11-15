{
  description = "Jenya NixOS Flake Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    proxy-suite.url = "github:FUFSoB/proxy-suite-flake";
    proxy-suite.inputs.nixpkgs.follows = "nixpkgs";

    # nixvim.url = "github:nix-community/nixvim";
    # nixvim.inputs.nixpkgs.follows = "nixpkgs";

    # nvf.url = "github:notashelf/nvf";
    # nvf.inputs.nixpkgs.follows = "nixpkgs";

    # nur.url = "github:nix-community/NUR";
    # nur.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      nixpkgs,
      # , nixvim
      # , nvf
      # , nur
      ...
    }@inputs:
    let
      hosts = import ./hosts.nix;
      mkHost = (import ./lib { inherit inputs; }).mkHost;

      inherit (nixpkgs) lib;

      # Системы, для которых есть выходы (formatter/devShells/checks), берём из
      # hosts.nix — иначе список пришлось бы править в двух местах.
      systems = lib.unique (lib.mapAttrsToList (_: host: host.system or "x86_64-linux") hosts);

      # Инструменты форматирования и линтинга: одно место вместо четырёх.
      tooling = pkgs: [
        pkgs.treefmt
        pkgs.nixfmt
        pkgs.deadnix
        pkgs.statix
        pkgs.shfmt
      ];

      forAllSystems = lib.genAttrs systems;
      pkgsFor = system: nixpkgs.legacyPackages.${system};
    in
    {
      # Имя конфигурации = имя хоста в hosts.nix.
      nixosConfigurations = lib.mapAttrs mkHost hosts;

      # `nix fmt` — прогоняет treefmt по дереву. PATH нужен, потому что
      # treefmt вызывает внешние команды из treefmt.toml.
      formatter = forAllSystems (
        system:
        let
          pkgs = pkgsFor system;
        in
        pkgs.writeShellScriptBin "treefmt" ''
          export PATH="${pkgs.lib.makeBinPath (tooling pkgs)}:$PATH"
          exec ${pkgs.treefmt}/bin/treefmt "$@"
        ''
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = pkgsFor system;
        in
        {
          default = pkgs.mkShell {
            packages = (tooling pkgs) ++ [ pkgs.nixd ];
            shellHook = ''
              echo "nix fmt — форматирование, nix flake check — проверки"
            '';
          };
        }
      );

      # Проверки для CI. Сборку конфигурации не запускают — только
      # форматирование и статический анализ, поэтому быстрые.
      checks = forAllSystems (
        system:
        let
          pkgs = pkgsFor system;
          src = pkgs.lib.cleanSource ./.;
        in
        {
          formatting =
            pkgs.runCommand "check-formatting"
              {
                nativeBuildInputs = tooling pkgs;
              }
              ''
                cp -r ${src} source
                chmod -R u+w source
                cd source
                treefmt --fail-on-change --no-cache
                touch $out
              '';

          # `docs/` не проверяем: в snippets лежат архивы кода, часть которого
          # заведомо не используется (для этого их и выносили).
          deadnix =
            pkgs.runCommand "check-deadnix"
              {
                nativeBuildInputs = [ pkgs.deadnix ];
              }
              ''
                deadnix --fail ${src}/nixos ${src}/home ${src}/flake.nix
                touch $out
              '';

          # statix пока не входит в проверки: в дереве ~20 предупреждений
          # (повторяющиеся ключи, пустые паттерны, `x = y;` вместо `inherit y;`),
          # а hardware-configuration.nix генерируется и править его нельзя.
          # Включим, когда почистим — задача в docs/TODO.md. В devShell он есть.
        }
      );
    };
}
