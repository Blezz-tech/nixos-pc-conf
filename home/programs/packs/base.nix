# Программы, у которых есть готовый модуль home-manager: включаются одной опцией,
# пакет в home.packages добавлять не нужно. Приложения без модуля — в common.nix
# или в тематических packs/.
{ ... }: {
  programs = {
    bun.enable = true;
    java.enable = true;
    fastfetch.enable = true;
    freetube.enable = true;
    pandoc.enable = true;
    yt-dlp.enable = true;

    # Менеджер паролей: autostart кладёт его в трей при входе в сессию
    keepassxc = {
      enable = true;
      autostart = true;
    };
  };
}
