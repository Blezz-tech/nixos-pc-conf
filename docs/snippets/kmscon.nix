# kmscon — консоль на KMS/DRM вместо обычной tty: юникод, нормальные шрифты,
# сглаживание. В NixOS НЕ подключён.
#
# Что даёт по сравнению с console.* (nixos/modules/tty.nix):
#   - шрифты с TrueType/OTF вместо PSF;
#   - работает без X11, но с аппаратным ускорением (hwRender);
#   - больше шрифтов и юникод в выводе.
#
# Что ломает: systemd-vconsole-setup и console.font перестают действовать,
# раскладку надо настраивать отдельно. Поэтому пробовать — на отдельной
# конфигурации (specialisation), а не сразу в основной.
{ ... }: {
  services.kmscon = {
    enable = true;
    hwRender = true;
    # шрифт и раскладка задаются здесь, console.* игнорируются:
    # extraConfig = ''
    #   font-name=Terminus
    #   font-size=16
    # '';
  };
}
