# Выключенные алиасы из home/shell/aliases.nix.
#
# Живой файл: home/shell/aliases.nix. Здесь лежит то, что оттуда убрали на шаге 30
# серии рефакторинга: часть алиасов ссылалась на несуществующий флейк-атрибут
# `#pc` (конфигурация называется `nixos-jenya`), часть была опасной
# (`nix store gc` без спроса), часть — просто закомментированным хламом.
#
# Файл не подключён: home-manager его не читает. Чтобы вернуть алиас —
# раскомментировать нужную строку и перенести в home/shell/aliases.nix
# (или импортировать этот файл из home/shell/default.nix, тогда он подхватится
# сам через libx.allModules).
{
  home.shellAliases = {
    # --- редактирование конфига ------------------------------------------------
    # myViewConf = "cd myConf && nvim .";
    # myGit = "~/git-repos";
    # myServicesOption = "nixos-option services";

    # --- пересборка: старый вариант, во флейке нет атрибута #pc -----------------
    # Рабочая замена живёт в home/shell/aliases.nix: myBuild.
    # myBuildSystem = "sudo nixos-rebuild switch --show-trace --flake ~/nixos-pc-conf#pc";
    # myBuildHome = "home-manager switch --flake ~/nixos-pc-conf";
    # myBuildAll = "myBuildSystem ; myBuildHome";

    # --- удаление старых поколений --------------------------------------------
    # myDeleteSystem = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system";
    # myDeleteHome = "nix profile wipe-history --profile ~/.local/state/nix/profiles/home-manager";
    # myDeleteAll = "myDeleteSystem ; myDeleteHome";

    # --- сборка мусора: осторожно, стирает всё, что не в текущем поколении -----
    # myClear = ''
    #   sudo nix store gc
    #   # sudo nix store optimise
    # '';

    # --- разное ---------------------------------------------------------------
    # myNixbuild = "nix-build -E 'with import <nixpkgs> {}; callPackage ./default.nix {}' ";
    # myPasswordGenerator = "date +%s | sha256sum | base64 | head -c 32 ; echo";

    # --- каталоги userDirs, которые не используются ---------------------------
    # Public   = "~/media/public";
    # Template = "~/media/templates";
  };
}
