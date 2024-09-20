let
  font = "Hack";
in
{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "${font}:size=10";
      };
      colors = {
        alpha = 0.8;
      };
    };
  };
}
