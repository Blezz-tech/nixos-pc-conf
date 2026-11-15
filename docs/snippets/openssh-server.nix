# SSH-сервер. В конфигурации НЕ подключён: вход на машину только локальный.
# Был закомментирован в nixos/modules/openssh.nix, пока файл не разобрали по смыслу.
#
# Если понадобится вход по сети:
#   1. скопировать файл в nixos/modules/ и добавить импорт в modules/default.nix;
#   2. ключи уже работают через gpg-agent (см. nixos/modules/gnupg.nix,
#      enableSSHSupport = true), пароль отключён настройками ниже;
#   3. открыть порт 22 — он сейчас закрыт, см. nixos/modules/networking.nix.
{ ... }: {
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
  };
}
