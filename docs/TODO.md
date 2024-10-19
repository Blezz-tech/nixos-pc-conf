# TODO по NixOS (НиксОси)

Временное отключение (т.к. сбой сборки)

goldendict-ng
calibre


- [ ] Сделать так, чтобы файлы dabkrs и dabruks добавлялись в папку пользователя ~/dicts/
- [ ] Сделать пакет stepik-oauth2-videodownloader

  https://github.com/StepicOrg/stepik-oauth2-videodownloader
- [ ] Удалить kando из blezz-pkgs когда его добавят в nixpkgs
- [ ] Сделать отключение звука по hdmi
  
  Чтобы с монитора не было звука
- [ ] проверить, что нет проблем с настройками [tty](./nixos/modules/tty.nix)
- [ ] Удалить модуль zapret, когда его добавят в nixpkgs


## ГЛАВНОЕ

## Сделать оптимизацию

Непонятна ошибка вылезает, не понятно как пофиксить

error: a 'x86_64-linux' with features {gccarch-alderlake} is required to build '/nix/store/pk96nikxyv1gnjx4yvay91zzm1s17yjr-bootstrap-stage0-glibc-bootstrapFiles.drv', but I am a 'x86_64-linux' with features {benchmark, big-parallel, kvm, nixos-test}

```nix
{
  nixpkgs.hostPlatform = lib.mkDefault {
    gcc.arch = "alderlake";
    gcc.tune = "alderlake";
    system = "x86_64-linux";
  };
  system-features = [
    "gccarch-alderlake"
    "gcctune-alderlake"
    "benchmark"
    "big-parallel"
    "kvm"
    "nixos-test"
  ];
}
```

```nix
{

## Проблемы

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

### Добавить пакеты для nix-ld
# Добавить пакеты для wayland 

### Перенести gt-vein-info
# /nixos/modules/gt-vein-info -> /nixos/pkgs/gt-vein-info
# перенести callPackages для gt-vein-info из /nixos/modules/user.nix -> /nixos/packages.nix

### Разнести конфиги из /nixos/default
# Разнести соответствующие сервисы в файлы
# xserver.nix desktopManagerv displayManager.nix nix-conf.nix

### yakuake
# Подумать, нужен ли yakuake

## Пакеты

### Добавить ПО
bilibili
qq
wechat-uos # license.tar.gz можно взять с репозиторя archlinux 
qqwing
smassh
p7zip
aria2
media-downloader
kdePackages.krdc
libreoffice-qt6-fresh # Заменить обычный libreoffice на qt6
onlyoffice-bin_latest # Заменить обычный onlyoffice на latest
kdenlive

stirling-pdf
naps2
kicad
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
# ЯП nim
nim
nimlsp

### Найти ПО для сканирования от KDE и добавить naps2
naps2

### сделать перенос всякого мусора из ~ в папку ~/.uwucache
# Например, ~/.cargo -> ~/.uwucache/.cargo
# сделать для всего мусора, что скапливается в системе (если конечно не прибито гвоздями)
# https://stackoverflow.com/questions/38050995/how-can-the-location-of-cargos-configuration-directory-be-overridden

### попробовать использовать keyd

### Загрузочный экран (boot splash screen.)
# И его настройка. Или найти альтернативу
# boot.plymouth.enable = true;

### Попробовать САПРы
# cadzinho
# librecad
# kompass3d

### Попробовать ПОшки от KDE
# KColorChooser
# KolourPaint
# KGpg
# Kompare
# KRDC
# Skanlite
# Sweeper
# Elisa
# KTimer
# KCachegrind
# Kamoso
# Kalzium
# KGeography
# KMouseTool
# KGet
# Marble
# KDiamond
# Kookbook

### Сначала закомментировать модуль xdg и проверить, нормально ли работают вещи, потом попробовать ещё что-то. Попробовать добавить к конфигурации 
# xdg.portal = {
#   enable = true;
#   extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
#   configPackages = mkDefault [ pkgs.kdePackages.xdg-desktop-portal-kde ];
# };

### Проверить, что за хренотень

system.activationScripts.diff = {
  supportsDryActivation = true;
  text = ''
    if [[ -e /run/current-system ]]; then
      ${pkgs.nix}/bin/nix store diff-closures /run/current-system "$systemConfig"
    fi
  '';
};


## Home Manager

### Включить где можно
enableBashIntegration = true;
enableZshIntegration = true;
enableNushellIntegration = true;
}

## попробовать использовать kmscon
# services.kmscon = {
#   enable = true;
#   hwRender = true;
# };

## Сделать конфигурацию для neofetch/fastfetch с выводом тянки
#
# ⡏⠉⠉⠉⠉⠉⠉⠋⠉⠉⠉⠉⠉⠉⠋⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠙⠉⠉⠉⠹
# ⡇⢸⣿⡟⠛⢿⣷⠀⢸⣿⡟⠛⢿⣷⡄⢸⣿⡇⠀⢸⣿⡇⢸⣿⡇⠀⢸⣿⡇⠀
# ⡇⢸⣿⣧⣤⣾⠿⠀⢸⣿⣇⣀⣸⡿⠃⢸⣿⡇⠀⢸⣿⡇⢸⣿⣇⣀⣸⣿⡇⠀
# ⡇⢸⣿⡏⠉⢹⣿⡆⢸⣿⡟⠛⢻⣷⡄⢸⣿⡇⠀⢸⣿⡇⢸⣿⡏⠉⢹⣿⡇⠀
# ⡇⢸⣿⣧⣤⣼⡿⠃⢸⣿⡇⠀⢸⣿⡇⠸⣿⣧⣤⣼⡿⠁⢸⣿⡇⠀⢸⣿⡇⠀
# ⣇⣀⣀⣀⣀⣀⣀⣄⣀⣀⣀⣀⣀⣀⣀⣠⣀⡈⠉⣁⣀⣄⣀⣀⣀⣠⣀⣀⣀⣰
# ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷
# ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇
# ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽
# ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕
# ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕
# ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕
# ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄
# ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕
# ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿
# ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
# ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟
# ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠
# ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙
# ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣
#
# ⣿⣯⣿⣟⣟⡼⣿⡼⡿⣷⣿⣿⣿⠽⡟⢋⣿⣿⠘⣼⣷⡟⠻⡿⣷⡼⣝⡿⡾⣿
# ⣿⣿⣿⣿⢁⣵⡇⡟⠀⣿⣿⣿⠇⠀⡇⣴⣿⣿⣧⣿⣿⡇⠀⢣⣿⣷⣀⡏⢻⣿
# ⣿⣿⠿⣿⣿⣿⠷⠁⠀⠛⠛⠋⠀⠂⠹⠿⠿⠿⠿⠿⠉⠁⠀⠘⠛⠛⠛⠃⢸⣯
# ⣿⡇⠀⣄⣀⣀⣈⣁⠈⠉⠃⠀⠀⠀⠀⠀⠀⠀⠀⠠⠎⠈⠀⣀⣁⣀⣀⡠⠈⠉
# ⣿⣯⣽⡿⢟⡿⠿⠛⠛⠿⣶⣄⠀⠀⠀⠀⠀⠀⠈⢠⣴⣾⠛⠛⠿⠻⠛⠿⣷⣶
# ⣿⣿⣿⠀⠀⠀⣿⡿⣶⣿⣫⠉⠀⠀⠀⠀⠀⠀⠀⠈⠰⣿⠿⠾⣿⡇⠀⠀⢺⣿
# ⣿⣿⠻⡀⠀⠀⠙⠏⠒⡻⠃⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠐⡓⢚⠟⠁⠀⠀⡾⢫
# ⣿⣿⠀⠀⡀⠀⠀⡈⣉⡀⡠⣐⣅⣽⣺⣿⣯⡡⣴⣴⣔⣠⣀⣀⡀⢀⡀⡀⠀⣸
# ⣿⣿⣷⣿⣟⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⢾⣷⣿
# ⣿⣿⣟⠫⡾⠟⠫⢾⠯⡻⢟⡽⢶⢿⣿⣿⡛⠕⠎⠻⠝⠪⢖⠝⠟⢫⠾⠜⢿⣿
# ⣿⣿⣿⠉⠀⠀⠀⠀⠈⠀⠀⠀⠀⣰⣋⣀⣈⣢⠀⠀⠀⠀⠀⠀⠀⠀⠀⣐⢸⣿
# ⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿
# ⣿⣿⣿⣿⣦⡔⠀⠀⠀⠀⠀⠀⢻⣿⡿⣿⣿⢽⣿⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿
# ⣿⣿⣿⣿⣿⣿⣶⣤⣀⠀⠀⠀⠘⠛⢅⣙⣙⠿⠉⠀⠀⠀⢀⣠⣴⣿⣿⣿⣿⣿
# ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣄⣅⠀⠓⠀⠀⣀⣠⣴⣺⣿⣿⣿⣿⣿⣿⣿⣿

## Сделать команды для изоюражений выше ^^^
# 
# function ahegao() {
#     echo "⣿⣯⣿⣟⣟⡼⣿⡼⡿⣷⣿⣿⣿⠽⡟⢋⣿⣿⠘⣼⣷⡟⠻⡿⣷⡼⣝⡿⡾⣿"
#     echo "⣿⣿⣿⣿⢁⣵⡇⡟⠀⣿⣿⣿⠇⠀⡇⣴⣿⣿⣧⣿⣿⡇⠀⢣⣿⣷⣀⡏⢻⣿"
#     echo "⣿⣿⠿⣿⣿⣿⠷⠁⠀⠛⠛⠋⠀⠂⠹⠿⠿⠿⠿⠿⠉⠁⠀⠘⠛⠛⠛⠃⢸⣯"
#     echo "⣿⡇⠀⣄⣀⣀⣈⣁⠈⠉⠃⠀⠀⠀⠀⠀⠀⠀⠀⠠⠎⠈⠀⣀⣁⣀⣀⡠⠈⠉"
#     echo "⣿⣯⣽⡿⢟⡿⠿⠛⠛⠿⣶⣄⠀⠀⠀⠀⠀⠀⠈⢠⣴⣾⠛⠛⠿⠻⠛⠿⣷⣶"
#     echo "⣿⣿⣿⠀⠀⠀⣿⡿⣶⣿⣫⠉⠀⠀⠀⠀⠀⠀⠀⠈⠰⣿⠿⠾⣿⡇⠀⠀⢺⣿"
#     echo "⣿⣿⠻⡀⠀⠀⠙⠏⠒⡻⠃⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠐⡓⢚⠟⠁⠀⠀⡾⢫"
#     echo "⣿⣿⠀⠀⡀⠀⠀⡈⣉⡀⡠⣐⣅⣽⣺⣿⣯⡡⣴⣴⣔⣠⣀⣀⡀⢀⡀⡀⠀⣸"
#     echo "⣿⣿⣷⣿⣟⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⢾⣷⣿"
#     echo "⣿⣿⣟⠫⡾⠟⠫⢾⠯⡻⢟⡽⢶⢿⣿⣿⡛⠕⠎⠻⠝⠪⢖⠝⠟⢫⠾⠜⢿⣿"
#     echo "⣿⣿⣿⠉⠀⠀⠀⠀⠈⠀⠀⠀⠀⣰⣋⣀⣈⣢⠀⠀⠀⠀⠀⠀⠀⠀⠀⣐⢸⣿"
#     echo "⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿"
#     echo "⣿⣿⣿⣿⣦⡔⠀⠀⠀⠀⠀⠀⢻⣿⡿⣿⣿⢽⣿⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿"
#     echo "⣿⣿⣿⣿⣿⣿⣶⣤⣀⠀⠀⠀⠘⠛⢅⣙⣙⠿⠉⠀⠀⠀⢀⣠⣴⣿⣿⣿⣿⣿"
#     echo "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⣄⣅⠀⠓⠀⠀⣀⣠⣴⣺⣿⣿⣿⣿⣿⣿⣿⣿"
# }
# 
# alias myBuildSystem='
# 
# sudo nixos-rebuild ...
# 
# ahegao
# '

## Найти как включить отпимизациюю
# мой гайд: https://gist.github.com/Blezz-tech/07db8fc68ab57ff844ae795bcf0c28f8

## Astrovim vs Lunarvim
# Сравнить и выбрать

### Создать репо с гайдиками

#  git Не нужно подписывать все репо ключем gpg, достаточно подписать последний коммит
# > Since commits contain cryptographic hashes of their parents all the way back to the beginning of the repo history, signing the last commit is equivalent to signing all of the commits.
```

### js-netfilter

<https://github.com/NixOS/nixpkgs/issues/194114#issuecomment-1859954277>

### Когда сделаю alvr

Использовать alvr из основной репы

### Добавить для .desktop файлов приложений русское описание



## Команды

Вывод процессора

```bash
cpufetch -F --accurate-pp --accurate-pp  --measure-max-freq --logo-short -v
```


## Решенные проблемы

### 2024.10.11 Таки решена проблема с шрифтами (на данный момент работают)

> Таки реши проблему с шрифтами в стиме
> 
> ```nix
> programs.steam.fontPackages
> ```
> > Font packages to use in Steam.
> > 
> > Defaults to system fonts, but could be overridden to use other fonts — useful for users who would like to customize CJK fonts used in Steam. According to the [upstream issue](https://github.com/ValveSoftware/steam-for-linux/issues/10422#issuecomment-1944396010), Steam only follows the per-user fontconfig configuration.
