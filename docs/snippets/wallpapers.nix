# Пакет со своими обоями из репозитория GitHub. В конфигурации НЕ подключён.
#
# Чтобы работало: положить файл в nixos/pkgs/wallpapers/default.nix, добавить
# его в environment.systemPackages или home.packages и обновлять hash после
# каждого изменения репозитория (nix-prefetch-url --unpack или nix build при
# неверном hash — nix сам покажет правильный).
#
# Симлинк в ~/media/images/pkgs/ можно делать через home.file или xdg.configFile;
# xdg.userDirs.pictures указывает на ~/media/images (home/xdg/default.nix).
{
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation (finalAttrs: {
  name = "blezz-tech-wallpapers";
  version = "v0.1";

  src = fetchFromGitHub {
    owner = "Blezz-tech";
    repo = "wallpapers";
    rev = finalAttrs.version;
    hash = "sha256-AUH32T5mH6bXtwGXv/vuuYK5BDgOQ1SMjZKXh6WDPqw=";
  };

  buildPhase = ''cp -pr $src/ $out/'';

  meta = {
    description = "My wallpapers";
  };
})
