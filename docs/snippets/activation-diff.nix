# Показывать diff-closures при каждом переключении системы.
# В NixOS НЕ подключён — но это одна из самых полезных мелочей.
#
# После подключения `nixos-rebuild switch` / `nh os switch` будет печатать:
#   ADDED   akonadi 26.08.3, +4.49 MiB
#   CHANGED system-path +979 KiB
# то есть изменения состава пакетов, а не только «сборка завершилась».
#
# supportsDryActivation = true: работает и при `nixos-rebuild dry-activate`,
# то есть diff можно посмотреть до переключения.
{ pkgs, ... }: {
  system.activationScripts.diffClosures = {
    supportsDryActivation = true;
    text = ''
      if [[ -e /run/current-system ]]; then
        echo "--- diff с текущей системой ---"
        ${pkgs.nix}/bin/nix store diff-closures /run/current-system "$systemConfig"
      fi
    '';
  };
}
