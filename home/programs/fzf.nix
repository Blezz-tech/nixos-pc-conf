{ pkgs
, ...
}: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
