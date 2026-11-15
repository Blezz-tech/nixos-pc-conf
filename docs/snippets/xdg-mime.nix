# Связи MIME-типов с приложениями. В конфигурации НЕ подключён: переехал сюда из
# nixos/modules/default.nix, где лежал закомментированным примером.
#
# Нужно, если какой-то тип файла по умолчанию открывается не тем приложением,
# а через GUI настроить не получается (Plasma хранит выбор в ~/.config/mimeapps.list).
{ ... }: {
  xdg.mime.enable = true;
  xdg.mime.addedAssociations = {
    "application/drawio" = "drawio.desktop";
  };
}
