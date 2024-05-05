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
    };
  };
}
