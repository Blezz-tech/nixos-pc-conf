# Браузеры. Firefox ставится отдельным модулем NixOS (nixos/programs/firefox.nix).
{ pkgs, ... }: {
  home.packages = [
    pkgs.google-chrome # несвободный, разрешён nixpkgs.config.allowUnfree
    pkgs.tor-browser
    pkgs.vivaldi
  ];
}
