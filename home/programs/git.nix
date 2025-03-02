{ pkgs
, ...
}:
{
  programs = {
    git = {
      enable = true;
      lfs.enable = true;
      package = pkgs.gitFull;
      difftastic = {
        enable = true;
        # display = "inline";
      };

      userName = "blezz-tech";
      userEmail = "markus.jenya04@yandex.ru";
      signing.key = "78E9CCD7CF92CD8F";
      extraConfig = {
        init.defaultBranch = "master";
        core = {
          quotepath = false;
          autocrlf = "input";
          filemode = false;
          editor = "code --wait";
        };
        commit.gpgsign = true;
        tag.gpgsign = true;
        credential.helper = "store";
        # TODO: Нужно попробоавть использовать Git Credential Manager
        # https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage

      };

      ignores = [
        "venv"
        ".venv"
        ".env"
        "node_modules"
        ".direnv"
      ];
    };

    git-cliff = {
      enable = true;
    };
  };
}
