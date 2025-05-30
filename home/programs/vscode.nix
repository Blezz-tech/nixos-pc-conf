{
  programs.vscode = {
    enable = true;
    profiles.default = {
      keybindings = [
        {
          key = "ctrl+[Backquote]";
          command = "workbench.action.terminal.toggleTerminal";
        }
      ];
      userSettings = {
        "editor.minimap.enabled" = false;
        "editor.rulers" = [ 80 ];

        "explorer.confirmDragAndDrop" = false;

        "git.enableSmartCommit" = true;
        "git.openRepositoryInParentFolders" = "always";
        "git.confirmSync" = false;
        "git.autofetch" = true;
        "git.blame.editorDecoration.enabled" = true;

        "window.customTitleBarVisibility" = "auto";

        "workbench.sideBar.location" = "right";
        "workbench.activityBar.location" = "top";
        "workbench.startupEditor" = "none";

        "zig.path" = "zig";
        "window.titleBarStyle" = "custom";

        # Python
        "python.analysis.typeCheckingMode" = "strict";

        # telemetry
        "redhat.telemetry.enabled" = false;
        "telemetry.telemetryLevel" = "crash";

        # https://code.visualstudio.com/docs/remote/troubleshooting
        # "remote.SSH.showLoginTerminal" =  true;
        # "remote.SSH.useLocalServer" = false;

        # "html.format.wrapLineLength" = 0; # убрать авто перенос текста
      };
    };
  };
}
