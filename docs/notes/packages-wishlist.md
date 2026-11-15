# Кандидаты в пакеты (не установлены)

Всё, что когда-то пробовалось или планировалось, но не установлено. Раньше это жило
закомментированными строками прямо в `home.packages` — то есть в файле, который читают
как список установленного. Комментарий там ничего не делает, но выглядит как настройка,
и приходится каждый раз выяснять, установлен пакет или нет.

Имена — как были в конфиге. Что делает пакет, проверяется на
<https://search.nixos.org/packages>.

Поставить, не меняя конфиг:

```bash
nix shell nixpkgs#vopono -c vopono --help
```

## nixos/packages.nix

| Пакет | Комментарий |
|-------|-------------|
| `nur.repos.ataraxiasjel.waydroid-script` | нужен вход `nur` во flake, которого нет |
| `jetbrains.pycharm-community` | IDE PyCharm |
| `vopono` | запуск приложений через VPN-неймспейсы |

## home/programs/common.nix — 92 шт.

Утилиты для разработки и консоли: `pkgs.git-sim` (симулятор git-команд),
`pkgs.git-spice` (stacked PR для git), `pkgs.github-desktop`, `pkgs.cachix`,
`pkgs.vengi-tools`, `pkgs.just`, `pkgs.go`, `pkgs.zig`, `pkgs.stack`,
`pkgs.ihp-new`, `pkgs.helix`, `pkgs.code-cursor`, `pkgs.scc`, `pkgs.cloc`,
`pkgs.yq-go`, `pkgs.rars`, `pkgs.neofetch`, `pkgs.nnn` (файловый менеджер), `pkgs.far2l`,
`pkgs.eaglemode`, `pkgs.treesheets`, `pkgs.kando`, `pkgs.activate-linux`,
`pkgs.distrobox`, `pkgs.age`, `pkgs.sops`, `pkgs.archivebox`,
`pkgs.openapi-generator-cli`, `pkgs.postman`.

Базы данных: `pkgs.mysql-workbench`, `pkgs.dbeaver-bin`.

Документы, книги, учёба: `pkgs.calibre`, `pkgs.zim`, `pkgs.glow`, `pkgs.hugo`,
`pkgs.mdbook-epub`, `pkgs.mdbook-pdf`, `pkgs.zotero`, `pkgs.anki`, `pkgs.okteta`,
`pkgs.geogebra6`, `pkgs.zeal-qt6`, `pkgs.goldendict-ng`, `pkgs.crow-translate`,
`pkgs.wpsoffice`, `pkgs.notepad-next`, `pkgs.rstudio`.

Графика, 3D, CAD: `pkgs.figma-linux`, `pkgs.graphviz`, `pkgs.cura`,
`pkgs.cura-appimage`, `pkgs.digikam`, `pkgs.rawtherapee`, `pkgs.freecad-wayland`,
`pkgs.openscad`, `pkgs.openscad-lsp`, `pkgs.kicad`, `pkgs.gpu-viewer`,
`pkgs.flameshot`, `pkgs.haruna`, `pkgs.baobab`, `pkgs.sfxr`, `pkgs.sfxr-qt`.

Игры и геймдев-инструменты: `pkgs.dorion`, `pkgs.tiled`, `pkgs.ldtk`,
`pkgs.unityhub`, `pkgs.anilibria-winmaclinux`.

Сеть и удалённый доступ: `pkgs.nextcloud-client`, `pkgs.nextcloud-talk-desktop`,
`pkgs.rustdesk-flutter`, `pkgs.parsec-bin`, `pkgs.remmina`, `pkgs.nekoray`,
`pkgs.whatsapp-for-linux`, `pkgs.mtr`, `pkgs.iperf3`, `pkgs.dnsutils`, `pkgs.dig`,
`pkgs.ldns`, `pkgs.ipcalc`, `pkgs.ethtool`, `pkgs.iftop`.

Мониторинг системы: `pkgs.iotop`, `pkgs.strace`, `pkgs.ltrace`, `pkgs.lsof`,
`pkgs.sysstat`, `pkgs.lm_sensors`.

Распознавание и синтез речи: `pkgs.easyocr`, `pkgs.rhvoice`, `pkgs.speechd`.

## home/programs/packs/dev.nix — 26 шт.

Haskell (весь стек закомментирован): `pkgs.haskell.packages.ghc9122.cabal-install`,
`pkgs.haskell.packages.ghc9122.haskell-language-server`,
`pkgs.haskell.packages.ghc9122.hlint`, `pkgs.haskell.packages.ghc9122.ghc`,
`pkgs.ghciwatch`.

PHP: `myPHP.php`, `myPHP.php.packages.composer`, `myPHP.php.packages.php-codesniffer`.
Объявление `myPHP` было мёртвым кодом (собиралось при eval, но нигде не
использовалось) и удалено — восстанавливать отсюда. Расширения, которые в нём
перечислялись: `all.bcmath`, `all.tokenizer`, `all.curl`, `all.gd`, `all.intl`,
`all.mbstring`, `all.zip`, `all.sqlite3`, `all.pdo_mysql`, `all.mysqli`,
`all.redis` (`all.xml` был закомментирован). При возврате PHP замените
`pkgs.php83` на актуальную версию из nixpkgs.

C/C++: `pkgs.gcc`, `pkgs.cmake` (сейчас стоят только `clang` и `clang-analyzer`).

Прочее: `pkgs.agda`, `pkgs.rocq-core`,
`pkgs.coqPackages.vscoq-language-server`, `pkgs.nodePackages_latest.prettier`.

Python — библиотеки, которые были закомментированы в `python-custom`:
`python-pkgs.jupyter`, `python-pkgs.ipykernel`, `python-pkgs.pyautogui`,
`python-pkgs.pynput`, `python-pkgs.scikit-learn`, `python-pkgs.nltk`,
`python-pkgs.pymorphy3`, `python-pkgs.plotly` (долго собирается),
`python-pkgs.torch`, `python-pkgs.notebook`.

Стоят сейчас (не трогали): `numpy`, `scipy`, `pandas`, `matplotlib`, `sympy`,
`beautifulsoup4`, `python-lsp-server`, `black`. В новом файле параметр
`withPackages` называется `ps`, то есть добавлять надо `ps.jupyter`, а не
`python-pkgs.jupyter`.

## home/programs/packs/games.nix — 62 шт.

Лаунчеры: `pkgs.nexusmods-app-unfree`, `pkgs.ryubing` (Switch), `pkgs.shadps4`
(PS4), `pkgs.lutris`, `pkgs.itch`.
Мод-менеджеры: `pkgs.limo`.

Стратегии и стратегии-ремейки: `pkgs.vcmi`, `pkgs.fheroes2`, `pkgs.wesnoth`,
`pkgs.openra`, `pkgs.openttd`, `pkgs.openrct2`, `pkgs.simutrans`,
`pkgs.widelands`, `pkgs.warzone2100`, `pkgs.unciv`, `pkgs.keeperrl`.

RPG и приключения: `pkgs.openxray`, `pkgs.arx-libertatis`, `pkgs.opengothic`,
`pkgs.cataclysm-dda`, `pkgs.endless-sky`, `pkgs.vangers`, `pkgs.iagno`,
`pkgs.tome4`.

Шутеры и гонки: `pkgs.openspades`, `pkgs.redeclipse`, `pkgs.warsow`,
`pkgs.urbanterror`, `pkgs.stuntrally`, `pkgs.taisei`, `pkgs.ruffle`,
`pkgs.opentyrian`, `pkgs.openclonk`, `pkgs.neverball`, `pkgs.cmatrix`.

Головоломки и roguelike: `pkgs.the-powder-toy`, `pkgs.crawlTiles`,
`pkgs.hedgewars`, `pkgs.osu-lazer-bin`, `pkgs.minetest`, `pkgs.superTuxKart`,
`pkgs.airshipper`.

Pixel Dungeon-серия: `pkgs.shorter-pixel-dungeon`,
`pkgs.summoning-pixel-dungeon`, `pkgs.experienced-pixel-dungeon`,
`pkgs.rat-king-adventure`, `pkgs.rkpd2`, `pkgs.shattered-pixel-dungeon`.

KDE-игры: `pkgs.kdePackages.kolf`, `pkgs.kdePackages.kmahjongg`,
`pkgs.kdePackages.knights`, `pkgs.kdePackages.knavalbattle`,
`pkgs.kdePackages.kmines`, `pkgs.kdePackages.picmi`, `pkgs.kdePackages.ksudoku`,
`pkgs.kdePackages.kpat`, `pkgs.kdePackages.ksirk`, `pkgs.kdePackages.kajongg`,
`pkgs.kdePackages.kwordquiz`.

## home/programs/packs/media.nix — 10 шт.

3D: `pkgs.blender-hip`. Музыка: `pkgs.musescore`. Графика: `pkgs.gimp`,
`pkgs.inkscape`, `pkgs.krita`, `pkgs.aseprite`, `pkgs.anime4k`.
Видео и аудио: `pkgs.audacity`, `pkgs.openai-whisper` (транскрибация в текст),
`pkgs.auto-editor`.

## home/programs/packs/messengers.nix — 6 шт.

`pkgs.element-desktop`, `pkgs.discord-screenaudio`, `pkgs.webcord-vencord`,
`pkgs.nheko`, `pkgs.fractal`, `pkgs.revolt-desktop`.

## home/programs/packs/kde.nix — 11 шт.

`pkgs.kdePackages.kolourpaint`, `pkgs.kdePackages.kasts`,
`pkgs.kdePackages.juk`, `pkgs.kdePackages.kalzium`,
`pkgs.kdePackages.kfind`, `pkgs.kdePackages.ksystemlog`,
`pkgs.kdePackages.kio-gdrive`, `pkgs.kdePackages.kcharselect`,
`pkgs.kdePackages.wallpaper-engine-plugin`, `pkgs.kdePackages.neochat`,
`pkgs.kdePackages.kdenlive`.

## home/programs/packs/tex.nix — 4 шт.

`pkgs.texlive.combined.scheme-full` (сейчас стоит `texliveSmall` с 10 пакетами —
полная схема весит гигабайты), `pkgs.ocrmypdf`, `pkgs.tesseract`,
`pkgs.pdfarranger`.

## home/programs/packs/archive.nix — 3 шт.

`pkgs.rar` (сам архиватор, вместо него стоит `unrar-free` для распаковки),
`pkgs.runzip`, `pkgs.ventoy-full`.

## home/programs/packs/custom.nix — 2 шт.

`pkgs.blezz-pkgs.davinci-resolve`, `pkgs.blezz-pkgs.MURMUR.CLION.v2025_2_2` —
из своего оверлея `blezz-pkgs`. Оба тяжёлые: DaVinci требует распаковки архивов
(~3 ГБ), MURMUR собирается из исходников.

## Из старого `TODO.md` — 19 шт.

Этот список жил в `docs/TODO.md` в разделе «Пакеты» и переехал сюда, когда TODO
стал списком задач.

Приложения: `bilibili`, `qq`, `wechat-uos` (лицензию брать из Arch-репозитория),
`stirling-pdf`, `media-downloader`, `kdePackages.kate`, `kdePackages.yakuake`,
`kdePackages.krdc`.

Утилиты: `aha` (ANSI → HTML), `clinfo` (информация об OpenCL), `wayland-utils`,
`p7zip`, `smassh` (тренажёр печати TUI), `qqwing` (судоку).

Языки: `nim`, `nimlsp`.

САПР (попробовать): `cadzinho`, `librecad`, `kompass3d`.

Отдельно: `eglinfo` — закомментирован в старом TODO как «возможно, не нужен».
