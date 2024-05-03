{
  programs.vscode = {
    enable = true;
    keybindings = [
      {
        key = "ctrl+[Backquote]";
        command = "workbench.action.terminal.toggleTerminal";
      }
    ];
  };
}
