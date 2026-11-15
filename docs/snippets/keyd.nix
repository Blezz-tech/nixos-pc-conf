# keyd — ремап клавиш на уровне демона: работает в консоли, X11 и Wayland
# одинаково. В NixOS НЕ подключён.
#
# Когда нужен: переназначить CapsLock на Ctrl/Esc, сделать слой с цифрами или
# стрелками, поменять поведение клавиш на уровне, который видят все приложения.
#
# В отличие от переопределения в KDE (kxkbrc) и от console.keyMap
# (nixos/modules/tty.nix), keyd работает до графической сессии и под ними всеми.
{ ... }: {
  services.keyd = {
    enable = true;

    keyboards.default = {
      ids = [ "*" ];
      settings = {
        main = {
          capslock = "overload(control, esc)"; # удержание — Ctrl, нажатие — Esc
        };
      };
    };
  };
}
