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

      aliases = {
        # View abbreviated SHA, description, and history graph of the commits
        l = "log --pretty=oneline --graph --abbrev-commit";
        # View the current working tree status using the short format
        s = "status -s";
        ss = "status";
        # show verbose output about tags, branches or remotes
        tags = "tag -l";
        branches = "branch -a";
        remotes = "remote -v";
        # Fetch all remotes and remove stale references
        fa = "fetch --all --prune";
      };
    };

    git-cliff = {
      enable = true;
    };
  };
}
