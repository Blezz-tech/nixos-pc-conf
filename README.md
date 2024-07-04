# nixos-conf

Моя никсось

# ГЛАВНОЕ

ИСПОЛЬЗОВАТЬ ВЕРСИЮ 24.05

а потом последовательно обновлять, исправляя изменения конфигурации

# Сделать потом

```nix
{

## Проблемы

### Добавить к стиму
programs.steam.gamescopeSession.enable = true;

### Таки реши проблему с шрифтами в стиме
programs.steam.fontPackages
# Font packages to use in Steam.
# Defaults to system fonts, but could be overridden to use other fonts — useful for users who would like to customize CJK fonts used in Steam. According to the [upstream issue](https://github.com/ValveSoftware/steam-for-linux/issues/10422#issuecomment-1944396010), Steam only follows the per-user fontconfig configuration.

### Включить wayland для electron приложений
environment.sessionVariables.NIXOS_OZONE_WL = "1";


### Поменять sddm
services.displayManager.sddm = {
  enable = true;
  wayland.enable = true;
  wayland.compositor = "kwin";
  package = pkgs.kdePackages.sddm;
};

### Добавить оптимизации
nix = {
  optimise.automatic = true;

  settings.experimental-features = [ "nix-command" "flakes" ];
  settings.auto-optimise-store = true;

  gc.automatic = true;
  gc.dates = "daily";
  gc.options = "--delete-older-than 14d";
};

### Добавить ключи для бинарного кеша HIP (Integrated Haskell Platform)
nix.settings = {
  trusted-public-keys = [ "digitallyinduced.cachix.org-1:y+wQvrnxQ+PdEsCt91rmvv39qRCYzEgGQaldK26hCKE=" ];
  trusted-substituters = [ "https://digitallyinduced.cachix.org" ];
};

### Убрать
extraPackages = with pkgs; [
  intel-media-driver # LIBVA_DRIVER_NAME=iHD
  vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
  vaapiVdpau
  libvdpau-va-gl
];

### Может быть добавить
services.fwupd.enable = true; # Нужна для просмотра информации о системе kde

### Исправить отключение konsole
environment.plasma6.excludePackages = with pkgs; [ kdePackages.konsole ];

# Поменять в пакет
# kate -> kdePackages.kate

###  alacritty -> konsole
# Убать alacritty из системы и hm
# оставить konsole

### Добавить пакет обоев
# { stdenv
# , fetchFromGitHub
# }:
# stdenv.mkDerivation (finalAttrs: {
#   name = "blezz-tech-wallpapers";
#   version = "v0.1";
# 
#   src = fetchFromGitHub {
#     owner = "Blezz-tech";
#     repo = "wallpapers";
#     rev = finalAttrs.version;
#     hash = "sha256-AUH32T5mH6bXtwGXv/vuuYK5BDgOQ1SMjZKXh6WDPqw=";
#   };
# 
#   buildPhase = ''cp -pr $src/ $out/'';
# 
#   meta = {
#     description = ''
#       My wallpapers
#     '';
#   };
# })

### сделать пакет обоев доступным для пользователя
# Чтобы home manager делал симлинк в xdg.userDirs.pictures/pkgs/

### Отключи podman
# Закоментируй импорт
# nixos/modules/default.nix

### Добавить пакеты для nix-ld
# Добавить пакеты для wayland 

### Перенести gt-vein-info
# /nixos/modules/gt-vein-info -> /nixos/pkgs/gt-vein-info
# перенести callPackages для gt-vein-info из /nixos/modules/user.nix -> /nixos/packages.nix

### Разнести конфиги из /nixos/default
# programs.hyprland перенести в /nixos/modules/default
# Разнести соответствующие сервисы в файлы
# xserver.nix desktopManagerv displayManager.nix nix-conf.nix

### Убрать standalone home manager
# Убрать найстройку для nixd из .vecode/settings.json:
# "options": {
#     "nixos": {
#         "expr": "(builtins.getFlake \"/home/jenya/nixos-pc-conf/\").nixosConfigurations.pc.options"
#     },
#     "home-manager": {
#         "expr": "(builtins.getFlake \"/home/jenya/nixos-pc-conf/\").homeConfigurations.jenya.options"
#     }
# }

## Пакеты

### Добавить к системным шрифтам
source-han-sans
font-awesome
source-sans
source-sans-pro
nerdfonts
liberation_ttf
nerdfonts
scientifica

### Добавить ПО
kdePackages.ksystemlog
bilibili
qq
wechat-uos # license.tar.gz можно взять с репозиторя archlinux 
qqwing
smassh
zeal
rars
p7zip
aria2
media-downloader
kdePackages.krdc
libreoffice-qt6-fresh # Заменить обычный libreoffice на qt6
kdenlive
glaxnimate # Для kdenlive (проверить, без и с этип пакетом, чтобы не было ошибки)
# Словари для libreoffice
hunspell
hunspellDicts.ru_RU
hunspellDicts.en_US
kdePackages.kate
kdePackages.yakuake
# Для KDE (Информация о система)
aha
clinfo
# eglinfo
glxinfo
vulkan-tools
wayland-utils


## Home Manager

### Включить где можно
enableBashIntegration = true;
enableZshIntegration = true;
enableNushellIntegration = true;
}
```