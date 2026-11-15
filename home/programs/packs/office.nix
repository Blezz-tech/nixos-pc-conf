# Офисные пакеты и проверка орфографии.
{ pkgs, ... }: {
  home.packages = [
    pkgs.libreoffice-qt-stable
    pkgs.onlyoffice-desktopeditors

    # hunspell — для LibreOffice и OnlyOffice, aspell — для консольных утилит
    pkgs.hunspell
    pkgs.hunspellDicts.ru_RU
    pkgs.hunspellDicts.en_US
    pkgs.aspell
    pkgs.aspellDicts.en
    pkgs.aspellDicts.ru
  ];
}
