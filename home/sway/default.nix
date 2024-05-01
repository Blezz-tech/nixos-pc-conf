{
  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "alacritty";
      startup = [
        # Launch Firefox on start
        { command = "alacritty"; }
      ];
    };
  };
}
