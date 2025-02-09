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
      "workbench.sideBar.location" = "right";
      "workbench.activityBar.location" = "top";
      "window.customTitleBarVisibility" = "auto";
      "git.confirmSync" = false;
      "git.autofetch" = true;
      "editor.minimap.enabled" = false;
      "git.enableSmartCommit" = true;
      "workbench.startupEditor" = "none";
      "git.openRepositoryInParentFolders" = "always";
      "explorer.confirmDragAndDrop" = false;
      "editor.rulers" = [ 80 ];
      # "html.format.wrapLineLength" = 0; # убрать авто перенос текста
      "git.blame.editorDecoration.enabled" = true;

      "zig.path" = "zig";
    };
  };
}
