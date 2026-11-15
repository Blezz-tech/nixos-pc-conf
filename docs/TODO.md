# TODO

Только задачи, которые можно взять и сделать. Разборы, ссылки и «когда-нибудь
попробовать» — в `docs/notes/` и `docs/snippets/`, чтобы этот файл оставался
списком дел, а не свалкой.

## Инфраструктура

- [ ] **Локальные пакеты → `nixos/pkgs/<name>/package.nix`.** Сейчас `dabruks`,
      `dabkrs`, `gt-vein-info`, `tg-ws-proxy`, `davinci-resolve`, `MURMUR`,
      `zapret-discord-youtube` описаны через `callPackage` внутри
      `nixos/overlays.nix` (157 строк вместе с оверрайдами). Формат
      `pkgs/by-name` даёт автозагрузку и убирает ручной список.

- [ ] **`dabkrs`/`dabruks`: убрать `builtins.currentTime`.** Сейчас версия
      вычисляется в момент сборки (`nixos/pkgs/*/default.nix`), из-за чего
      конфигурация не вычисляется в чистом режиме. Нужно вынести версию и `hash`
      в параметры пакета. Заодно: словари сейчас раскладываются в store, а
      приложение ждёт их в `~/dicts` — добавить симлинк через `home.file`.

- [ ] **Секреты через `sops-nix`.** `tgWsProxy.secretFile` указывает на открытый
      файл `/home/jenya/tg-ws-proxy-secret` (`nixos/proxy-suite.nix`). Через
      sops секрет становится `config.sops.secrets`, права 0400, и не лежит в
      домашнем каталоге открытым.

- [ ] **`programs.nh.clean.enable = true`.** `nh` установлен, но автоочистки
      store нет (`nixos/programs/system.nix`). Даёт `nh clean all` по таймеру:
      раз в неделю, с сохранением последних поколений.

## Настройки

- [ ] **Звук по HDMI.** Сейчас вывод переключается на монитор вместе с
      подключением. Нужно либо отключать HDMI-профиль в PipeWire при
      подключении, либо закрепить аналоговый выход как default.

- [ ] **Проверить консоль.** `nixos/modules/tty.nix` задаёт шрифт `ter-v32n` и
      `keyMap = "ru"`. Убедиться, что при загрузке шрифт подхватывается и
      раскладка ожидаемая. Альтернативы — `docs/snippets/kmscon.nix` (юникод,
      KMS-рендер) и `docs/snippets/keyd.nix` (ремап на уровне демона).

- [ ] **`chromium` включён дважды.** В `nixos/programs/chromium.nix` — политики
      (`extraOpts`, `enablePlasmaBrowserIntegration`), в
      `home/programs/chromium.nix` — флаги командной строки (`commandLineArgs`,
      `nativeMessagingHosts` для keepassxc). Это разные опции разных модулей,
      так что обе нужны. Проверить: не ставится ли при этом два пакета
      chromium — в `systemPackages` и в профиле пользователя.

- [ ] **`zapret` уже есть в nixpkgs.** В закреплённой ревизии появился
      `nixos/modules/services/networking/zapret.nix` (`services.zapret` с
      `params`, `whitelist`, `blacklist`). Сейчас используется
      `services.proxy-suite.zapret` из отдельного флейка плюс свой пакет
      `zapret-discord-youtube` в `nixos/pkgs/`. Посмотреть, хватает ли опций
      nixpkgs-модуля: если да — минус внешняя зависимость и минус 60 строк
      оверлея.

- [ ] **Включить `statix` в проверки.** В `flake.nix` он пока не в `checks`:
      в дереве около двадцати предупреждений (повторяющиеся ключи, пустые
      паттерны, `x = y;` вместо `inherit y;`), а `nixos/hardware-configuration.nix`
      генерируется и править его нельзя — его придётся исключать из проверки.
      Почистить и добавить `checks.statix` обратно.

## Мелочи

- [ ] **Мусор в домашнем каталоге → `~/.uwucache`.** `~/.cargo`, `~/.npm`,
      `~/.cache`-подобные каталоги лежат в корне `$HOME`. Для большинства есть
      переменные (`CARGO_HOME`, `npm_config_cache`), которые можно выставить в
      `home/shell/session_vars.nix`. Оговорка: часть инструментов путь прибивает
      гвоздями — см. <https://stackoverflow.com/questions/38050995>.

- [ ] **Русские описания в `.desktop`.** У части приложений `Comment` на
      английском. Либо через `environment.etc`, либо через `home.file` для
      нужных `.desktop`.

- [ ] **`yakuake`.** Решить, нужен ли выпадающий терминал: сейчас его нет, а
      `foot`/`alacritty` закрывают задачу. Если нужен — добавить в
      `home/programs/packs/kde.nix`.

- [ ] **`stepik-oauth2-videodownloader`.** Сделать пакет:
      <https://github.com/StepicOrg/stepik-oauth2-videodownloader>. Python,
      проще всего через `buildPythonApplication` в `nixos/pkgs/`.

- [ ] **MURMUR зависит от съёмного диска.** Сборки IDEA/PHPStorm/CLion
      переопределены в `nixos/overlays.nix` через `builtins.fetchurl` с
      `file:///run/media/jenya/disk_d/binfiles/...` и `file:///home/jenya/CLion-...`.
      Если диск не смонтирован, ломается не сборка конкретного пакета, а
      **вычисление всей конфигурации**. Перенести архивы на постоянный путь
      (например `~/binfiles`) или в локальный кэш.

## Не задачи, а заметки

- «Попробовать» пакеты — `docs/notes/packages-wishlist.md` (216 позиций).
- Как собирать, `gcc.arch`, порталы, hosts — `docs/notes/reference.md`.
- Что уже решено — `docs/notes/solved.md`.
- Выключенные модули и заготовки — `docs/snippets/`.
