{
  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "blezz-tech";
    userEmail = "markus.jenya04@yandex.ru";
    extraConfig = {
      core.quotepath = false;
      core.autocrlf = "input";
      core.filemode = false;
      commit.gpgsign = true;
      tag.gpgsign = true;
    };
  };
}
