# Решённые проблемы

Чтобы не разбираться повторно. Формат: симптом → причина → что сделано.

## Шрифты в Steam (2024.10.11)

**Симптом:** в интерфейсе Steam вместо части глифов (CJK, спецсимволы) квадраты.

**Причина:** Steam не использует системный fontconfig целиком — он читает
**пользовательский** конфиг. Пакеты шрифтов, попавшие только в system-wide
fontconfig, ему не видны ([ValveSoftware/steam-for-linux#10422](https://github.com/ValveSoftware/steam-for-linux/issues/10422#issuecomment-1944396010)).

**Решение:** опция NixOS `programs.steam.fontPackages`:

```nix
programs.steam.fontPackages = with pkgs; [
  noto-fonts
  noto-fonts-cjk-sans
];
```

По умолчанию там системные шрифты; опция нужна, когда нужного набора в системе нет
или он собран иначе.

## Сборка под свой процессор в отдельной оболочке

**Задача:** собрать пакет с `-march=alderlake`, не переводя всю систему на
самосборку.

**Решение:** свой `import` nixpkgs с `localSystem`:

```nix
let
  pkgs = import <nixpkgs> {
    localSystem = {
      gcc.arch = "alderlake";
      gcc.tune = "alderlake";
      system = "x86_64-linux";
    };
  };
in
pkgs.mkShell {
  buildInputs = [ pkgs.nodejs ];
}
```

**Важно:** это работает только для локальной сборки. Кэш `cache.nixos.org` для
такой платформы пуст, поэтому всё, включая bootstrap, собирается с нуля. Для
всей системы так делать нельзя без `nix.settings.system-features` — подробности
и текст ошибки в `docs/notes/reference.md`, раздел «gcc.arch и system-features».

## Загрузочный экран Plymouth без 500 МБ тем

**Симптом:** пакет `adi1090x-plymouth-themes` тянет 50+ тем на полгигабайта.

**Решение:** override с одной темой (`nixos/hardware-configuration.nix`):

```nix
loneTheme = pkgs.adi1090x-plymouth-themes.override {
  selected_themes = [ "lone" ];
};

boot.plymouth = {
  enable = true;
  theme = "lone";
  themePackages = [ loneTheme ];
  showDelay = 0;
};
```

Работает: `boot.consoleLogLevel = 0` и `boot.kernelParams = [ "quiet" "splash" ]`
убирают текст загрузки, чтобы был виден только Plymouth.

## clr / OpenCL и blender

**Симптом:** OpenCL ломается, blender не запускается.

**Причина:** [nixpkgs#417992](https://github.com/NixOS/nixpkgs/issues/417992).

**Обход:** не включать `hardware.amdgpu.opencl.enable` и не ставить
`blender-hip` одновременно. Сейчас `hardware.amdgpu.opencl.enable = true`
(`nixos/hardware-configuration.nix`), а `blender-hip` не установлен — он в
`docs/notes/packages-wishlist.md`. При возврате blender сначала проверить эту пару.

## Подпись git-коммитов ключом GPG

**Вопрос:** нужно ли подписывать каждый коммит.

**Ответ:** достаточно последнего. Коммит содержит хеш родителя, то есть цепочку
до самого начала истории; подпись последнего подтверждает всю цепочку. Для тегов
это не работает — тег подписывается отдельно.

## SSH-ключи через gpg-agent

**Симптом:** после переустановки системы `git push` требует ключ, которого нет в
`~/.ssh/`.

**Причина:** ключи лежат в GPG, а не в файлах.

**Решение:** `programs.gnupg.agent.enableSSHSupport = true`
(`nixos/modules/gnupg.nix`) — `SSH_AUTH_SOCK` указывает на gpg-agent. Проверка:

```bash
ssh-add -l          # список ключей из gpg-agent
echo $SSH_AUTH_SOCK # должен указывать на .../gnupg/S.gpg-agent.ssh
```
