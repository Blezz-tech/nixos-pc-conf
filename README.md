# nixos-conf

Моя никсось

# ГЛАВНОЕ

ИСПОЛЬЗОВАТЬ ВЕРСИЮ 24.05

а потом последовательно обновлять, исправляя изменения конфигурации

# Сделать потом

## Добавить к стиму

```nix
programs.steam.gamescopeSession.enable = true;
```

## Добавить к системным шрифтам

```nix
source-han-sans
```

## Таки реши проблему с шрифтами в стиме

```nix
programs.steam.fontPackages
```
Font packages to use in Steam.

Defaults to system fonts, but could be overridden to use other fonts — useful for users who would like to customize CJK fonts used in Steam. According to the [upstream issue](https://github.com/ValveSoftware/steam-for-linux/issues/10422#issuecomment-1944396010), Steam only follows the per-user fontconfig configuration.

## Добавить ПО

```nix
kdePackages.ksystemlog
```

## Поменять sddm

```nix
services.displayManager.sddm = {
  enable = true;
  wayland.enable = true;
  wayland.compositor = "kwin";
  package = pkgs.kdePackages.sddm;
};
```
## Home Manager

Включить где можно

```nix
enableBashIntegration = true;
enableZshIntegration = true;
enableNushellIntegration = true;
```



