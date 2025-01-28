{ pkgs
, ...
}: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.jenya = {
      isNormalUser = true;
      description = "jenya";
      extraGroups = [
        "networkmanager"
        "wheel"
        "video"
        "audio"
        "libvirtd"
        "podman" # Для Podman'а
        "corectrl"
        "scanner" # Для сканирования
        "lp" # Для печати
        # config.services.kubo.group
      ];
      packages = [ ];
    };
  };
}
