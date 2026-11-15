# Архив выключенных модулей

Здесь лежат куски конфигурации, которые **не подключены** к системе: либо модуль целиком
закомментирован, либо его импорт убран из `default.nix`. Файлы не собираются и ни на что не
влияют — они сохранены только как заготовка на будущее.

Правило: если блок кода не работает и не планируется в ближайшее время, он живёт здесь,
а не в дереве `nixos/` или `home/`. Там должен быть только действующий конфиг.

| Файл | Что внутри | Почему выключено |
|------|------------|------------------|
| `vr.nix` | `programs.alvr`, `services.monado`, `services.wivrn`, окружение XR-рантайма | 43 из 51 строки закомментированы; импорт убран из `nixos/modules/default.nix`. VR-шлема нет |
| `documentation-off.nix` | `documentation.{enable,doc,info,man,nixos}.enable = false` | отключает man-страницы и `nixos-help`; импорт убран из `nixos/modules/default.nix`, чтобы не терять справку |
| `tor.nix` | `services.tor` с `enable = true` | импорт отключён: tor-клиент с obfs4-мостом не используется |
| `postgresql.nix` | `services.postgresql` + `ensureDatabases`/`ensureUsers` | импорт отключён: локальная БД не используется |
| `sunshine.nix` | `services.sunshine.enable` (сервер стриминга) | импорт отключён: стриминг не настроен |
| `obs-studio.nix` | `programs.obs-studio` + плагины `wlrobs`, `obs-backgroundremoval` | импорт отключён: OBS не установлен ни в NixOS, ни в home-manager |
| `v2raya.nix` | `services.v2raya.enable` | импорт отключён: одна строка, сервис не используется |
| `weblate.nix` | `services.weblate.enable` | импорт отключён: одна строка, сервис не используется |
| `whoogle-search.nix` | `services.whoogle-search.enable` | импорт отключён: одна строка, сервис не используется |
| `zapret.nix` | `services.zapret` с ручными списками `udpPorts` и `blezz-pkgs`-пакетами | импорт отключён: то же самое уже делает `services.proxy-suite.zapret` в `nixos/proxy-suite.nix` (другой конфиг: `general(FAKE_TLS_AUTO_ALT3)`) |
| `kde-xdgdata-overlay.nix` | overlay, склеивающий `XDG_DATA_DIRS` для `plasma-workspace` | отключён в `nixos/overlays.nix`; лечил замедление KDE, симптомов больше нет |
| `openssh-server.nix` | рабочий модуль `services.openssh`: порт 22, без пароля, по ключам | SSH-сервер в конфиге не включён: вход на машину только локальный. Раньше жил закомментированным в `nixos/modules/openssh.nix` |
| `xdg-mime.nix` | `xdg.mime.enable` + `addedAssociations` для drawio | был закомментированным примером в `nixos/modules/default.nix` |
| `programs-disabled.nix` | `programs.throne`, `zoom-us`, `openvpn3` | были закомментированы в `nixos/programs/default.nix` |
| `kmscon.nix` | `services.kmscon` с hwRender | альтернатива обычной tty (юникод, KMS-шрифты), пробовать на specialisation |
| `keyd.nix` | `services.keyd`: CapsLock как Ctrl/Esc | ремап клавиш для консоли, X11 и Wayland сразу |
| `xdg-portal.nix` | `xdg.portal` с явными порталами KDE | портал включён без этих строк; нужно, если приложения жалуются на FileChooser/ScreenCast |
| `activation-diff.nix` | `system.activationScripts` с `nix store diff-closures` | показывает изменения пакетов при переключении; в конфиге не включён |
| `wallpapers.nix` | пакет с обоями из GitHub | заготовка пакета, hash надо обновлять вручную |
| `ascii-art.md` | ASCII-арт и функция для fastfetch | не конфиг, а банк картинок |

Вернуть в работу: скопировать файл обратно в исходный каталог (`nixos/modules/`, `nixos/services/`
или `nixos/programs/`) и добавить импорт в соответствующий `default.nix`.
