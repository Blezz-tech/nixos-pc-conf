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
        # "libvirtd"
        "podman" # Для Podman'а
        # "i2c"
        "corectrl"
        "scanner" # Для сканирования
        "lp" # Для печати
        # "wireshark"
      ];
      packages = [ ];
    };
  };
}
