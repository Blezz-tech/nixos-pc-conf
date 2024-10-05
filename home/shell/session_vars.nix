{
  home.sessionVariables = {
    # By default java does not enable antialiasing for font rendering. By exporting environment variables, this can be fixed:
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";

    CARGO_HOME = ''"$XDG_DATA_HOME"/cargo'';
  };
}
