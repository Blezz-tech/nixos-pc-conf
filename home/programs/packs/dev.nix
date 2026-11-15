# Инструменты разработки: компиляторы, форматтеры, LSP.
{ pkgs, ... }:
let
  # Интерпретатор с нужными библиотеками: ставятся одной деривацией, чтобы
  # не тянуть весь nixpkgs-набор python.
  python-custom = pkgs.python313.withPackages (ps: [
    ps.numpy
    ps.scipy
    ps.pandas
    ps.matplotlib
    ps.sympy
    ps.beautifulsoup4
    ps.python-lsp-server
    ps.black # форматтер
  ]);
in
{
  home.packages = [
    ## Python
    python-custom

    ## C/C++
    pkgs.clang
    pkgs.clang-analyzer

    ## Lua
    pkgs.lua
    pkgs.luarocks

    ## Rust
    pkgs.cargo
    pkgs.rustc
    pkgs.rust-analyzer
    pkgs.rustfmt
    pkgs.uv # менеджер пакетов Python на Rust

    ## Сборка и форматирование
    pkgs.gnumake
    pkgs.nixfmt # пришёл на смену nixpkgs-fmt: тот больше не развивается
    pkgs.nufmt # nushell
    pkgs.nix-search

    ## LSP
    pkgs.marksman # markdown
    pkgs.typescript-language-server # js/ts
    pkgs.nixd # nix
    pkgs.nil # nix, второй вариант (nixd умеет больше, nil стабильнее)
    pkgs.vscode-langservers-extracted # css, eslint, html, json
    pkgs.yaml-language-server
    pkgs.bash-language-server
  ];
}
