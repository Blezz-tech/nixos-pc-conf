# Справочник

Знания, которые были заперты в комментариях к конфигам. Здесь — чтобы не искать
по коду и не терять при чистке.

## Как собирать и проверять

```bash
nh os switch -f ~/nixos-pc-conf            # обычное переключение
nixos-rebuild build --flake .#nixos-jenya  # собрать, ничего не менять
nix store diff-closures /run/current-system ./result   # что изменится в пакетах
nixos-rebuild dry-activate --flake .#nixos-jenya       # что сделают activation-скрипты
nix eval --json .#nixosConfigurations.nixos-jenya.config.<опция>   # проверить одну опцию
```

`diff-closures` — главный инструмент. Он показывает не «сборка прошла», а **что
именно** изменилось: `ADDED akonadi +4.49 MiB` сразу видно, а в логе сборки — нет.

## Блокировка доменов Яндекс-рекламы

В `nixos/modules/networking.nix` сейчас активно только:

```nix
networking.extraHosts = ''
  127.0.0.1 mc.yandex.ru
'';
```

Когда-то там был весь список (45 доменов), закомментированный целиком. Если
понадобится — вернуть блок и добавить домены внутрь:

```nix
networking.extraHosts = ''
  127.0.0.1 mc.yandex.ru
  0.0.0.0 advertising.yandex.ru
  0.0.0.0 www.advertising.yandex.ru
  0.0.0.0 audience.yandex.ru
  0.0.0.0 www.audience.yandex.ru
  0.0.0.0 direct.yandex.ru
  0.0.0.0 www.direct.yandex.ru
  0.0.0.0 metrika.yandex.ru
  0.0.0.0 www.metrika.yandex.ru
  0.0.0.0 partner.yandex.ru
  0.0.0.0 www.partner.yandex.ru
  0.0.0.0 yandexdatafactory.com
  0.0.0.0 www.yandexdatafactory.com
  0.0.0.0 partner.yandex.ua
  0.0.0.0 www.partner.yandex.ua
  0.0.0.0 metrika.yandex.ua
  0.0.0.0 www.metrika.yandex.ua
  0.0.0.0 metrica.yandex.com
  0.0.0.0 www.metrica.yandex.com
  0.0.0.0 metrica.yandex.ru
  0.0.0.0 www.metrica.yandex.ru
  0.0.0.0 0.0.0.0 yastatic.net
  0.0.0.0 0.0.0.0 www.yastatic.net
  0.0.0.0 clck.yandex.ru
  0.0.0.0 www.clck.yandex.ru
  0.0.0.0 mc.yandex.ru
  0.0.0.0 www.mc.yandex.ru
  0.0.0.0 yabs.yandex.ru
  0.0.0.0 www.yabs.yandex.ru
  0.0.0.0 yabs.yandex.ua
  0.0.0.0 www.yabs.yandex.ua
  0.0.0.0 an.yandex.ru
  0.0.0.0 www.an.yandex.ru
  0.0.0.0 an.yandex.ua
  0.0.0.0 www.an.yandex.ua
  0.0.0.0 3ds.money.yandex.ru
  0.0.0.0 abo.market.yandex.ru
  0.0.0.0 bs.yandex.ru
  0.0.0.0 click.yandex.ru
  0.0.0.0 mc.yandex.ru
  0.0.0.0 0.0.0.0 market-click2.yandex.ru
  0.0.0.0 partner.market.yandex.ru
  0.0.0.0 www.adv.yandex.ru
  0.0.0.0 yandex-question.naydex.net
  0.0.0.0 naydex.net
  0.0.0.0 yandexadexchange.net
'';
```

Оговорка: `0.0.0.0` в `/etc/hosts` не защита. Firefox и Chrome с включённым DoH
ходят мимо системного резолвера, а приложения с собственными DNS-клиентами — тем
более. Для настоящей блокировки нужен DNS-уровень (AdGuard Home/Pi-hole или
`services.blocky`).

## gcc.arch и system-features

Идея: собирать пакеты под конкретный процессор (alderlake) вместо generic
`x86_64-linux`. Даёт несколько процентов производительности и цену: **все**
пакеты надо собирать локально, бинарный кэш nixos.org для такой платформы не
существует.

Что нужно (для `nixpkgs.hostPlatform`):

```nix
{
  gcc.arch = "alderlake";
  gcc.tune = "alderlake";
  system = "x86_64-linux";
}
```

и в `nix.settings.system-features`:

```nix
[ "gccarch-alderlake" "gcctune-alderlake" "benchmark" "big-parallel" "kvm" "nixos-test" ]
```

Без `system-features` сборка падает на bootstrap-пакетах:

```
error: a 'x86_64-linux' with features {gccarch-alderlake} is required to build
'/nix/store/…-bootstrap-stage0-glibc-bootstrapFiles.drv', but I am a
'x86_64-linux' with features {benchmark, big-parallel, kvm, nixos-test}
```

Пока это не включено — гайд с замерами: <https://gist.github.com/Blezz-tech/07db8fc68ab57ff844ae795bcf0c28f8>.
Локально под другой arch собирать можно точечно, см. `docs/notes/solved.md`.

## xdg.portal и MIME

`xdg.portal` включён в `nixos/default.nix` с `xdgOpenUsePortal = true` —
из-за [nixpkgs#160923](https://github.com/NixOS/nixpkgs/issues/160923):
`xdg-open` внутри `steam-run` иначе не находит обработчик.

Ассоциации типов файлов — `docs/snippets/xdg-mime.nix` (рабочий модуль, не
подключён). Через GUI настраивается в «Системные настройки → Приложения», но
Plasma пишет выбор в `~/.config/mimeapps.list`, и при пересборке он не теряется.

## Консоль и раскладка

`nixos/modules/tty.nix`: шрифт `ter-v32n` из `terminus_font`, `earlySetup`,
`keyMap = "ru"`. Раскладка задаётся **для консоли**, на графическую сессию не
влияет.

Альтернативы, которые пробовались или планируются — в `docs/snippets/`:

- `kmscon.nix` — консоль на KMS с нормальными шрифтами и юникодом;
- `keyd.nix` — ремап клавиш на уровне демона (работает и в консоли, и в X11/Wayland).

## fcitx5

Японский/китайский ввод настраивается в `nixos/modules/i18n.nix`, блок
закомментирован целиком (`i18n.inputMethod.type = "fcitx5"` и пакеты
`fcitx5-qt`, `fcitx5-rime`, `fcitx5-chinese-addons`). Раскомментировать, если
понадобится ввод иероглифов.

## Полезные ссылки

| Тема | Ссылка |
|------|--------|
| js-netfilter (блокировка через uBlock) | <https://github.com/NixOS/nixpkgs/issues/194114#issuecomment-1859954277> |
| Steam не видит шрифты | <https://github.com/ValveSoftware/steam-for-linux/issues/10422#issuecomment-1944396010> |
| clr/OpenCL ломает blender | <https://github.com/NixOS/nixpkgs/issues/417992> |
| stepik-oauth2-videodownloader (кандидат в пакет) | <https://github.com/StepicOrg/stepik-oauth2-videodownloader> |
| Гайд по оптимизации сборки | <https://gist.github.com/Blezz-tech/07db8fc68ab57ff844ae795bcf0c28f8> |

## Команды

```bash
# подробности о процессоре
cpufetch -F --accurate-pp --measure-max-freq --logo-short -v

# что занимает место в /nix/store
nix path-info -rS /run/current-system | sort -k2 -h | tail -20
```

## KDE-приложения, которые стоит попробовать

`kcolorchooser`, `kolourpaint`, `kgpg`, `kompare`, `skanlite`, `sweeper`,
`elisa`, `ktimer`, `kcachegrind`, `kamoso`, `kgeography`, `kmousetool`,
`kget`, `marble`, `kdiamond`, `kookbook`.

Часть уже стоит (`kompare`, `kclock`, `kleopatra`), остальные — нет. Полные имена
пакетов — в `docs/notes/packages-wishlist.md`.
