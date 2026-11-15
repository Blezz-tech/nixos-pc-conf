# Общие домашние пакеты: приложения без модуля home-manager и утилиты, которые
# нужны постоянно. Кандидаты, которые здесь когда-то были закомментированы, лежат
# в docs/notes/packages-wishlist.md.
{ pkgs, ... }: {
  home.packages = [
    ## Приложения
    pkgs.obsidian # заметки в markdown
    pkgs.sqlitebrowser # GUI для SQLite
    pkgs.imhex # hex-редактор
    pkgs.recoll # полнотекстовый поиск по локальным файлам
    pkgs.omegat # система переводов (CAT) для субтитров и текстов
    pkgs.v2rayn # GUI для xray/sing-box, движки раскладывает v2rayn.nix
    pkgs.coppwr # граф соединений PipeWire
    pkgs.mangohud # оверлей FPS/GPU в играх
    pkgs.vulkan-tools # vulkaninfo

    ## Разработка
    pkgs.lazygit # TUI для git
    pkgs.gitoxide # git status на Rust, обёртка над git
    pkgs.ast-grep # поиск и замена по AST
    pkgs.difftastic # структурный diff
    pkgs.treefmt # форматирование по дереву файлов
    pkgs.nodejs_latest
    pkgs.python3Packages.mutagen # чтение и запись тегов медиафайлов

    ## Typst (вёрстка вместо LaTeX)
    pkgs.typst
    pkgs.typstyle # форматтер typst
    pkgs.tinymist # LSP для typst
    pkgs.typst-live # живой предпросмотр

    ## Markdown
    pkgs.mdbook
    pkgs.mdbook-admonish # блоки-предупреждения для mdbook

    ## CLI
    pkgs.ripgrep
    pkgs.fd
    pkgs.jq
    pkgs.aria2
    pkgs.socat
    pkgs.nmap
    pkgs.traceroute
    pkgs.zbar # распознавание штрихкодов из консоли
    pkgs.gh # GitHub CLI
    pkgs.btop
    pkgs.cpufetch
    pkgs.nix-output-monitor # nom: читаемый вывод nix build
    pkgs.colorized-logs # ansi2txt и раскраска логов
    pkgs.pwgen
    pkgs.tree
    pkgs.file
    pkgs.which
    pkgs.cowsay

    ## Система
    pkgs.pciutils # lspci
    pkgs.usbutils # lsusb
    pkgs.lm_sensors
    pkgs.gnupg
    pkgs.gnused
    pkgs.gnutar
    pkgs.gawk
    pkgs.profile-sync-daemon # сервис включает services.psd, пакет нужен для команд psd
  ];
}
