{
  programs.vscode = {
    enable = true;
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

      # "html.format.wrapLineLength" = 0; # убрать авто перенос текста
    };
  };
}
