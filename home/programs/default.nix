{ config
, pkgs
, ...
}: {
  imports = [
    ./common.nix
    ./git.nix
    ./fzf.nix
    ./neovim.nix
    # ./nixvim.nix
    # ./browsers.nix
    # ./media.nix
    # ./xdg.nix
  ];
}
