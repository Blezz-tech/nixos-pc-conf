# KDE-приложения. Plasma ставится отдельным модулем, здесь только утилиты.
{ pkgs, ... }: {
  home.packages = with pkgs.kdePackages; [
    kleopatra # сертификаты и ключи GPG
    kcalc
    kclock
    kjournald # просмотр журнала systemd
    kompare # сравнение файлов в графике
    filelight # занятое место на диске, интеграция с Dolphin
    kdialog # диалоги из скриптов (нужен arx-libertatis)

    # Скриншоты. tesseractLanguages = null: без OCR-моделей, они весят сотни МБ
    (spectacle.override { tesseractLanguages = null; })
  ];
}
