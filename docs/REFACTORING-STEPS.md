# Как это сделано: 30 маленьких шагов

Рефакторинг разбит на **30 последовательных PR** — чтобы каждый можно было прочитать
за пару минут, а не разбираться в одном гигантском диффе.

## Как устроена серия

- PR нумерованы `01/30` … `30/30`, названия идут по порядку;
- PR'ы **последовательные**: следующий открывается после мержа предыдущего (у сессии одна
  ветка, поэтому параллельно стопкой их не выставить);
- каждый PR меняет 1–3 файла и оставляет конфигурацию рабочей;
- прогресс смотрим по номерам в заголовках PR: смержен последний — значит шаги до него сделаны.

## Шаги

Прогресс: **01–26** смержены, плюс догон **24a**.

Осталось 1 PR: 27–28 (этот), 29–30.

| № | Шаг | Что меняется | Зачем |
|---|-----|--------------|-------|
| 01 | chore: `.gitignore` + это оглавление | `.gitignore`, `docs/REFACTORING-STEPS.md` | мусор (`result`, `.direnv`) не попадёт в репозиторий |
| 02 | chore: мёртвые модули NixOS | `modules/vr.nix`, `documentation.nix` → `docs/snippets/` | 43 из 51 строк `vr.nix` закомментированы; оба файла не импортируются |
| 03 | chore: мёртвые сервисы, часть 1 | `services/{tor,postgresql,sunshine}.nix`, `programs/obs-studio.nix` → `docs/snippets/` | модули отключены, но лежат в дереве и создают иллюзию «оно работает» |
| 04 | chore: мёртвые сервисы, часть 2 | `services/{v2raya,weblate,whoogle-search,zapret}.nix`, `overlays/envvar.nix` → `docs/snippets/` | то же; `zapret` дублирует `proxy-suite`. `syncthing.nix` остаётся: он открывает порты и подключён |
| 05 | chore: no-op опции | `permittedInsecurePackages = []`, `programs.kde-pim { enable = false; … }`, `users.packages = []` | это значения по умолчанию — строки только шумят |
| 06 | chore: неиспользуемые аргументы | `pkgs` в `programs/chromium.nix`, `services/default.nix` | deadnix-ошибки, из-за них линтер не включить. В `i18n.nix` аргумент используется, `services/postgresql.nix` уже в архиве |
| 07 | refactor: `openssh.nix` по содержимому | → `gnupg.nix` + `mtr.nix`, закомментированный `services.openssh` → `docs/snippets/openssh-server.nix` | файл называется «ssh», а внутри gpg-agent и `mtr`. При этом sshd в конфиге вообще не включён |
| 08 | refactor: разбить `modules/default.nix` (1) | `boot.nix`, `environment.nix`; убран мёртвый пример `specialisation` | 64 строки в одном файле про загрузчик, wayland-переменные и Android-эмулятор |
| 09 | refactor: разбить `modules/default.nix` (2) | `nixpkgs.nix`, `virtualisation.nix`; `default.nix` — только импорты, мёртвые примеры `libinput`/`rocmSupport` убраны, `xdg.mime` в архив | то же |
| 10 | refactor: syncthing и psd | порты syncthing → `modules/networking.nix`; `services/psd.nix`; `services/syncthing.nix` удалён | файл называется syncthing, но `services.syncthing` в нём закомментирован (он в home-manager), а живого кода — 2 строки про firewall |
| 11 | refactor: `programs/default.nix` → `system.nix` | тело файла в `system.nix`, выключенные программы → `docs/snippets/programs-disabled.nix` | `default.nix` должен быть оглавлением, а не свалкой |
| 12 | refactor: `config.nix` → `modules/plasma-systemmonitor.nix` | своя опция `programs.plasma-systemmonitor` убрана, остался `security.wrappers` | опция объявлялась в одном файле, включалась в другом, и её никто не переопределял |
| 13 | refactor: `systemPackages` | убрать дубль `partitionmanager`, сгруппировать по темам; `home-manager` оставлен с объяснением | `partitionmanager` ставит `programs.partition-manager`; `home-manager` не дубль — HM как модуль NixOS свою CLI не ставит |
| 14 | refactor: `home/XDG` → `home/xdg` | переименование каталога, убран мёртвый импорт `# ./fcitx5` | остальные каталоги в нижнем регистре; `fcitx5` в дереве нет |
| 15 | refactor: `packs/default.nix` → `base.nix` | `programs.*` и keepassxc переезжают в отдельный файл | `default.nix` = только список импортов, 10 файлов packs/ были списком импортов с довеском |
| 16 | refactor: data-файлы v2rayN | из `home/shell/default.nix` → `home/programs/v2rayn.nix` | они про приложение, а не про shell; в `home/programs/` уже по файлу на приложение |
| 17 | docs: wishlist пакетов | `docs/notes/packages-wishlist.md` | 216 закомментированных пакетов в коде — это не код |
| 18 | chore: `common.nix` | только реально установленные пакеты, сгруппированные | 108 из 191 строк — комментарии |
| 19 | chore: `packs`: games, media, messengers | убрать комментарии (переехали в wishlist) | 68 из 91 строки в `games.nix` — комментарии |
| 20 | chore: `packs`: dev, kde, archive, tex, office, browsers, custom | чистка, `nixfmt` вместо `nixpkgs-fmt`, удалён мёртвый `myPHP` | `nixpkgs-fmt` заброшен; `myPHP` объявлялся и не использовался |
| 21 | docs: заметки и заготовки | `docs/notes/{reference,solved}.md`, шесть новых `docs/snippets/*`, hosts-блок из `networking.nix` | знания из комментариев в конфигах → в документацию |
| 22 | docs: переписать `TODO.md` | 88 строк, 13 задач с чекбоксами | 308 строк: 167 заголовков на 5 чекбоксов + незакрытый блок кода на 200 строк |
| 23 | chore: `treefmt` | `treefmt.toml`: `nixfmt` вместо `nixpkgs-fmt`, плюс `deadnix`, `statix`, `shfmt`; `.vscode` переведён на `nixfmt` | `treefmt.toml` ссылался на заброшенный `nixpkgs-fmt` и не был подключён к флейку |
| 24 | feat: `nix fmt`, `nix develop`, `nix flake check` | `formatter`, `devShells`, `checks` (`formatting`, `deadnix`, `statix`) в `flake.nix` | без этого нечем валидировать следующие шаги и не на что навесить CI |
| 24a | style: `nixfmt` по дереву | 34 файла: разметка по RFC-стилю, `shfmt` для `*.sh`, минус мёртвые аргументы; `statix` временно убран из `checks` | `treefmt.toml` переключён на `nixfmt` на шаге 23, а дерево осталось в стиле `nixpkgs-fmt` — иначе `checks.formatting` красный |
| 25 | ci: GitHub Actions | `.github/workflows/check.yml` (`nix flake check` + инстанцирование) и `update-flake-lock.yml` | проверки должны идти сами |
| 26 | refactor: `hosts.nix` + `lib/mkHost` | `hosts.nix`, `lib/default.nix`, `flake.nix`, `nixos/{default,modules/user,modules/networking}.nix` | `username` объявлен, но `users.jenya`, `user = "jenya"` и `hostName` — хардкод |
| 27 | refactor: автоимпорт NixOS | `lib/default.nix` (`libx.allModules`), `nixos/{modules,programs,services}/default.nix` | 3 ручных списка импортов (26 строк) → одна строка в каждом; файл рядом с другими подключается сам |
| 28 | refactor: автоимпорт home-manager | `home/{programs,shell}/default.nix`, удалён `home/programs/packs/default.nix` | рекурсия делает оглавление packs/ лишним: 12 + 11 строк списков → 3 строки |
| 29 | refactor: overlays по файлам | `overlays/{default,blezz-pkgs,prismlauncher}.nix` | 158 строк в одном файле, `pkgs.callPackage` → `final.callPackage` |
| 30 | refactor: пути и алиасы | syncthing-папки, `nh`, secret, `home/shell/aliases.nix`, `README.md` | `/home/jenya` в 12 местах + алиасы, указывающие на несуществующий `#pc` |

## Что НЕ входит в серию

Осознанно оставлено на потом (записано в `docs/TODO.md` на шаге 22):

- `dabkrs`/`dabruks`: `builtins.currentTime` → параметр `version`/`hash`;
- локальные пакеты → `pkgs/<name>/package.nix`;
- вынос `MURMUR`/`davinci`/`tg-ws-proxy` в отдельный флейк;
- консолидация `chromium`/`firefox`/`kdeconnect` между NixOS и home-manager;
- секреты в `sops-nix`.

Причина: это меняет поведение (или требует ручной проверки сборки), а вся серия 01–30
поведение системы не меняет — кроме явно перечисленных мелочей в шагах 13 и 20.
