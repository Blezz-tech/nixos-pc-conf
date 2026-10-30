{ pkgs, ... }:
{
  home.packages = [
    # Torrent
    pkgs.qbittorrent

    # 3D
    # pkgs.blender-hip

    # Музыка
    # pkgs.musescore

    # Редакторы epub
    pkgs.sigil

    # Графика
    # pkgs.gimp
    # pkgs.inkscape
    # pkgs.krita
    pkgs.drawio
    # pkgs.aseprite

    pkgs.imagemagick
    pkgs.oxipng # multithreaded lossless PNG/APNG compression optimizer
    pkgs.ffmpeg-full
    # pkgs.anime4k

    # Видео/аудио
    # pkgs.audacity
    # pkgs.openai-whisper # транскрибация аудио в текст
    # pkgs.auto-editor
  ];
}