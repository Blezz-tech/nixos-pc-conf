# Медиа, графика и торренты.
{ pkgs, ... }: {
  home.packages = [
    pkgs.qbittorrent # торрент-клиент

    pkgs.drawio # диаграммы
    pkgs.sigil # редактор epub

    pkgs.imagemagick # convert: конвертация и пакетная обработка картинок
    pkgs.oxipng # lossless-сжатие PNG
    pkgs.ffmpeg-full # все кодеки для конвертации видео и аудио
  ];
}
