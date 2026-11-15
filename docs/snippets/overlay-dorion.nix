# Оверлей, который берёт dorion и cef-binary прямо из PR в nixpkgs (pull/579758).
# Выключен: ждём, пока PR вольют, и тогда эти пакеты появятся в nixpkgs сами.
# Скопировано из nixos/overlays.nix при разбиении оверлеев по файлам (шаг 29).
{ pkgs }:
self: super:
let
  # Получаем исходный код PR (или конкретный коммит)
  prSrc = super.fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs";
    rev = "pull/579758/head"; # или конкретный хеш коммита
    hash = "sha256-UdiYSbM2QD65P5MtdAaKlb800DfpWR6izy5ldgmNMeM="; # первый запуск выдаст хеш
  };
in
{
  dorion = self.callPackage "${prSrc}/pkgs/by-name/do/dorion/package.nix" { };
  cef-binary = self.callPackage "${prSrc}/pkgs/by-name/ce/cef-binary/package.nix" { };
}
