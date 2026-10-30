{ pkgs, ... }:
{
  home.packages = [
    pkgs.rar
    pkgs.unrar-free
    pkgs.zip
    pkgs.xz
    pkgs.unzip
    pkgs._7zz
    pkgs.zstd
    # pkgs.runzip # Fixing zip archives
    # pkgs.ventoy-full
  ];
}