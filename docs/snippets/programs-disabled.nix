# Программы, которые когда-то включались или планировались, но сейчас выключены.
# В NixOS НЕ подключён. Переехал сюда из nixos/programs/default.nix, где лежал
# закомментированными строками без объяснений.
#
# Чтобы включить — раскомментировать нужное и импортировать файл в
# nixos/programs/default.nix. Проверьте, что программа вообще существует в вашей
# ревизии nixpkgs: programs.throne, например, приходит не из nixpkgs.
{ ... }: {
  # VPN-клиент с tun-режимом, часто используют для Telegram/YouTube
  # programs.throne = {
  #   enable = true;
  #   tunMode.enable = true;
  # };

  # Видеозвонки
  # programs.zoom-us.enable = true;

  # OpenVPN 3 клиент (в nixpkgs бывает нестабильным, отсюда комментарий)
  # programs.openvpn3.enable = true;
}
