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
        # "corectrl"
      ];
      packages = [
        (pkgs.callPackage ./gt-vein-info { })
      ];
    };
  };
}
