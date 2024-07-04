# nixos-conf

Моя никсось

# ГЛАВНОЕ

ИСПОЛЬЗОВАТЬ ВЕРСИЮ 24.05

а потом последовательно обновлять, исправляя изменения конфигурации

# Сделать потом

```nix
# Сделать потом

{


## Проблемы

# Добавить к стиму
programs.steam.gamescopeSession.enable = true;

# Таки реши проблему с шрифтами в стиме
programs.steam.fontPackages
# Font packages to use in Steam.
# Defaults to system fonts, but could be overridden to use other fonts — useful for users who would like to customize CJK fonts used in Steam. According to the [upstream issue](https://github.com/ValveSoftware/steam-for-linux/issues/10422#issuecomment-1944396010), Steam only follows the per-user fontconfig configuration.

# Поменять sddm
services.displayManager.sddm = {
  enable = true;
  wayland.enable = true;
  wayland.compositor = "kwin";
  package = pkgs.kdePackages.sddm;
};


## Пакеты

# Добавить к системным шрифтам
source-han-sans
font-awesome
source-sans
source-sans-pro
nerdfonts

# Добавить ПО
kdePackages.ksystemlog
bilibili
qq
wechat-uos # license.tar.gz можно взять с репозиторя archlinux 
qqwing
smassh

## Home Manager

# Включить где можно
enableBashIntegration = true;
enableZshIntegration = true;
enableNushellIntegration = true;
}
```