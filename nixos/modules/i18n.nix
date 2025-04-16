{ pkgs
, ...
}:
{
  i18n = {
    defaultLocale = "ru_RU.UTF-8";
    supportedLocales = [ "all" ];

    # extraLocaleSettings = {
    #   LC_ADDRESS = "ru_RU.UTF-8";
    #   LC_IDENTIFICATION = "ru_RU.UTF-8";
    #   LC_MEASUREMENT = "ru_RU.UTF-8";
    #   LC_MONETARY = "ru_RU.UTF-8";
    #   LC_NAME = "ru_RU.UTF-8";
    #   LC_NUMERIC = "ru_RU.UTF-8";
    #   LC_PAPER = "ru_RU.UTF-8";
    #   LC_TELEPHONE = "ru_RU.UTF-8";
    #   LC_TIME = "ru_RU.UTF-8";
    # };

    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = [
          pkgs.kdePackages.fcitx5-qt
          pkgs.fcitx5-rime
          pkgs.fcitx5-chinese-addons
          pkgs.rime-data
        ];
        plasma6Support = true;
        waylandFrontend = true;
      };
    };
  };
}
