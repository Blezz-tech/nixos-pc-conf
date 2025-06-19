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
        enable = false;
        # display = "inline";
      };
      attributes = [
        "*.sqlite diff=sqlite3"
      ];

      userName = "blezz-tech";
      userEmail = "markus.jenya04@yandex.ru";
      signing.key = "78E9CCD7CF92CD8F";
      signing.signByDefault = true;
      extraConfig = {
        init.defaultBranch = "master";
        core = {
          quotepath = false;
          autocrlf = "input";
          filemode = false;
          editor = "code --wait";

          # хз зачем нужно
          # fsmonitor = true;
          # untrackedCache = true;
        };
        tag = {
          sort = "version:refname";
        };
        diff = {
          algorithm = "histogram";
          colorMoved = "plain";
          mnemonicPrefix = true;
          renames = true;
          "sqlite3" = {
            binary = true;
            textconv = "echo .dump | sqlite3";
          };
        };
        push = {
          autoSetupRemote = true;
          followTags = true;
        };
        fetch = {
          prune = true;
          pruneTags = true;
          all = true;
        };
        rebase = {
          autoSquash = true;
          autoStash = true;
          updateRefs = true;
        };
        pull = {
          rebase = true;
        };
        merge = {
          conflictstyle = "zdiff3";
        };
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
