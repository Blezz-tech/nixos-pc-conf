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

    ## XDG_DATA_HOME
    CARGO_HOME = "$XDG_DATA_HOME/cargo"; # ~/.cargo
    NODE_REPL_HISTORY = "$XDG_DATA_HOME/node_repl_history"; # ~/.node_repl_history
    REDISCLI_HISTFILE = "$XDG_DATA_HOME/redis/rediscli_history"; # ~/.rediscli_history

    ## XDG_CONFIG_HOME
    XCOMPOSEFILE = "$XDG_CONFIG_HOME/X11/xcompose"; # ~/.XCompose
    NPM_CONFIG_USERCONFIG = "$XDG_CONFIG_HOME/npm/npmrc"; # for npm
    REDISCLI_RCFILE = "$XDG_CONFIG_HOME/redis/redisclirc"; # ~/.redisclirc

    ## XDG_CACHE_HOME
    XCOMPOSECACHE = "$XDG_CACHE_HOME/X11/xcompose"; # ~/.compose-cache

    ## XDG_STATE_HOME
    PYTHON_HISTORY="$XDG_STATE_HOME/python/history"; # ~/.python_history
  };

  xdg.configFile."npm/npmrc" = {
    source = ../files/.npmrc;
  };
}
