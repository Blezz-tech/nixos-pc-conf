{ pkgs, ... }:
{
  home.packages = [
    pkgs.libreoffice-qt-stable
    pkgs.onlyoffice-desktopeditors

    # Словари для libreoffice
    pkgs.hunspell
    pkgs.hunspellDicts.ru_RU
    pkgs.hunspellDicts.en_US

    # Словари
    pkgs.aspell
    pkgs.aspellDicts.en
    pkgs.aspellDicts.ru
  ];
}