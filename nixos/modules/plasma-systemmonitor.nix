{ pkgs, ... }: {
  # plasma-systemmonitor запускается от обычного пользователя, а для чтения
  # сетевой статистики ему нужен CAP_NET_RAW. Обёртка с capabilities даёт только
  # это право: не полный root, как у setuid-бинаря.
  #
  # Модуль всегда включён (импортируется из modules/default.nix). Понадобится
  # выключить — убрать импорт, а не строку здесь.
  security.wrappers.plasma-systemmonitor = {
    source = "${pkgs.kdePackages.plasma-systemmonitor}/bin/plasma-systemmonitor";
    capabilities = "cap_net_raw+ep";
    owner = "root";
    group = "root";
  };
}
