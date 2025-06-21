{ config
, ...
}:
{
  # Use Arch Wiki for fix app (use XDG Base Directory)
  # <https://wiki.archlinux.org/title/XDG_Base_Directory>

  home.sessionVariables = {
    # By default java does not enable antialiasing for font rendering. By exporting environment variables, this can be fixed:
    # -Dawt.useSystemAAFontSettings=lcd

    # ~/.java/.userPrefs ~/.java/fonts
    # -Djava.util.prefs.userRoot=\"$XDG_CONFIG_HOME\"/java

    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";

    # Исправление пути для приложений на соответствие со стандартом XDG Base Directory

    ## luanti (minetest)
    MINETEST_USER_PATH = "${config.xdg.dataHome}/luanti";

    ## cataclysm-dda
    CALCHISTFILE = "${config.xdg.cacheHome}/calc_history";

    ## Rust#Cargo
    CARGO_HOME = "${config.xdg.dataHome}/cargo"; # ~/.cargo

    ## Node.js
    NODE_REPL_HISTORY = "${config.xdg.dataHome}/node_repl_history"; # ~/.node_repl_history

    ## npm
    NPM_CONFIG_USERCONFIG = "${config.xdg.configHome}/npm/npmrc"; # for npm

    ## redis
    REDISCLI_HISTFILE = "${config.xdg.dataHome}/redis/rediscli_history"; # ~/.rediscli_history
    REDISCLI_RCFILE = "${config.xdg.configHome}/redis/redisclirc"; # ~/.redisclirc

    ## libx11
    XCOMPOSEFILE = "${config.xdg.configHome}/X11/xcompose"; # ~/.XCompose
    XCOMPOSECACHE = "${config.xdg.cacheHome}/X11/xcompose"; # ~/.compose-cache

    ## python
    PYTHON_HISTORY = "${config.xdg.stateHome}/python_history";
    PYTHONPYCACHEPREFIX = "${config.xdg.cacheHome}/python";
    PYTHONUSERBASE = "${config.xdg.dataHome}/python";

    ## Local TeX Live TeXmf tree, TeXmf caches and config
    TEXMFHOME = "${config.xdg.dataHome}/texmf";
    TEXMFVAR = "${config.xdg.cacheHome}/texlive/texmf-var";
    TEXMFCONFIG = "${config.xdg.configHome}/texlive/texmf-config";
  };

  xdg.configFile."npm/npmrc" = {
    source = ../files/.npmrc;
  };
}
