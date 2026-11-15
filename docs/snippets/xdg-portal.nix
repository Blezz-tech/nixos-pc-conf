# Вариант настройки xdg.portal с явным указанием порталов KDE.
# В конфигурации НЕ подключён: сейчас портал включён без этих строк
# (nixos/default.nix), и этого достаточно для xdg-open внутри steam-run.
#
# Понадобится, если приложения начнут жаловаться, что «нет портала для
# FileChooser/ScreenCast» — тогда порталы надо задать явно.
{ pkgs, ... }: {
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
    configPackages = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
  };
}
