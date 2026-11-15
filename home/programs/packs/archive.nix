# Архиваторы.
{ pkgs, ... }: {
  home.packages = [
    pkgs.unrar-free # распаковка rar; для упаковки нужен несвободный pkgs.rar
    pkgs.zip
    pkgs.unzip
    pkgs._7zz
    pkgs.xz
    pkgs.zstd
  ];
}
