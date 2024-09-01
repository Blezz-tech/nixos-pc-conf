{ pkgs
, ...
}:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    package = pkgs.gitFull;

    userName = "blezz-tech";
    userEmail = "markus.jenya04@yandex.ru";
    signing.key = "78E9CCD7CF92CD8F";
    extraConfig = {
      core.quotepath = false;
      core.autocrlf = "input";
      core.filemode = false;
      commit.gpgsign = true;
      tag.gpgsign = true;
    };
  };
}
