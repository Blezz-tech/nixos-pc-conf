{ pkgs, ... }: {
  # Редактор по умолчанию для всего, что смотрит на $EDITOR (git, sudoedit, mc)
  environment.variables.EDITOR = "nvim";

  # Wayland-режим для electron-приложений (VS Code, Discord, Obsidian)
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Общий буфер обмена между wayland-приложениями
  environment.systemPackages = [ pkgs.wl-clipboard ];
}
