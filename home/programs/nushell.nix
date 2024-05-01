{ pkgs
, ...
}:
{
  programs.nushell = {
    enable = true;
    package = pkgs.nushellFull;
    extraConfig = ''
      $env.PROMPT_COMMAND_RIGHT = ""
      $env.config.show_banner = false
    '';
  };
}
