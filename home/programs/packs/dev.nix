{ pkgs
, ...
}:
let
  myPHP.php = pkgs.php83.withExtensions ({ enabled, all }: enabled ++ [
    all.bcmath
    all.tokenizer
    all.curl
    all.gd
    all.intl
    # all.xml
    all.mbstring
    all.zip
    all.sqlite3
    all.pdo_mysql
    all.mysqli
    all.redis # Для Redis
  ]);
  python-custom = (pkgs.python313.withPackages (python-pkgs: [
    # python-pkgs.jupyter
    # python-pkgs.ipykernel
    # python-pkgs.pyautogui
    python-pkgs.scipy
    # python-pkgs.pynput
    python-pkgs.numpy
    python-pkgs.pandas
    python-pkgs.matplotlib
    python-pkgs.sympy
    # python-pkgs.scikit-learn
    # python-pkgs.nltk
    # python-pkgs.pymorphy3
    # python-pkgs.plotly # NOTE: Долго билдится
    # python-pkgs.torch
    python-pkgs.python-lsp-server
    python-pkgs.beautifulsoup4
    python-pkgs.black # python formattier
    # python-pkgs.jupyter
    # python-pkgs.notebook
  ]));
in
{
  home.packages = [
    ## PHP
    # myPHP.php
    # myPHP.php.packages.composer
    # myPHP.php.packages.php-codesniffer

    ## Python
    python-custom
    
    ## C/C++
    # pkgs.gcc
    pkgs.clang
    pkgs.clang-analyzer
    # pkgs.cmake
    
    ## Lua
    pkgs.lua
    
    ## Rust
    pkgs.cargo
    pkgs.rustc
    pkgs.rust-analyzer
    pkgs.uv
    pkgs.rustfmt # rust
    
    ## Other
    # pkgs.agda
    # pkgs.rocq-core
    # pkgs.coqPackages.vscoq-language-server # coq/rocq
    pkgs.gnumake
    pkgs.luarocks
    pkgs.nix-search
    pkgs.nufmt # nushell
    pkgs.nixpkgs-fmt # nix
    # pkgs.nodePackages_latest.prettier

    ### LSP
    pkgs.marksman # markdown
    pkgs.typescript-language-server # js/typescript
    pkgs.nixd # nix
    pkgs.nil # nix
    pkgs.vscode-langservers-extracted # css eslint html json markdown
    pkgs.yaml-language-server # yaml
    pkgs.bash-language-server # bash
  ];
}
