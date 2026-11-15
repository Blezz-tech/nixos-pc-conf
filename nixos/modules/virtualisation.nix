{ pkgs, ... }: {
  # Эмулятор Android. Требует ядро >= 4.18 (проверяется assertion в модуле)
  # и user namespaces; каталог waydroid0 открыт в брандмауэре самим модулем.
  virtualisation.waydroid.enable = true;

  # Явно nftables-сборка. Дефолт nixpkgs выбирает вариант по
  # networking.nftables.enable, а он равен false
  # (nixos/modules/services/networking/nftables.nix), хотя брандмауэр у нас
  # iptables. Без этой строки nixpkgs подставит pkgs.waydroid (iptables-вариант).
  virtualisation.waydroid.package = pkgs.waydroid-nftables;
}
