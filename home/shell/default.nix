{ config
, ...
}: {
  imports = [
    ./starship.nix
    ./alacritty.nix
    ./bash.nix
  ];
}
