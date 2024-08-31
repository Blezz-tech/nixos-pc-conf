{ pkgs
, ...
}:
{
  programs.nushell = {
    enable = true;
    package = pkgs.nushell;
    extraConfig = ''
      $env.PROMPT_COMMAND_RIGHT = ""
      $env.config.show_banner = false
    '';
  };
}
