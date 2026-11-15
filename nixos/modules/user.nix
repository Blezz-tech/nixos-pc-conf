{
  pkgs,
  username,
  ...
}:
{
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.${username} = {
      isNormalUser = true;
      description = username;
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
        "audio"
        # "libvirtd"
        "corectrl"
        "scanner" # Для сканирования
        "lp" # Для печати
        # config.services.kubo.group
      ];
    };
  };
}
