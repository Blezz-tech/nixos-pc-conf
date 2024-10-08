{
  home.shellAliases = {
    myZ = "cd ~/nixos-pc-conf; code .; exit";
    # myViewConf = "cd myConf && nvim .";
    # myGit = "~/git-repos";
    # myServicesOption = "nixos-option services";

    myErrors = "journalctl -p 3 -xb";

    # myBuildSystem = "sudo nixos-rebuild switch --show-trace --flake ~/nixos-pc-conf#pc";
    # myBuildHome = "home-manager switch --flake ~/nixos-pc-conf";
    # myBuildAll = "myBuildSystem ; myBuildHome";

    # myDeleteSystem = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system";
    # myDeleteHome = "nix profile wipe-history --profile ~/.local/state/nix/profiles/home-manager";
    # myDeleteAll = "myDeleteSystem ; myDeleteHome";

    # myClear = ''
    #   sudo nix store gc
    #   # sudo nix store optimise
    # '';
    myClearHistory = ''
      sudo journalctl --rotate
      sudo journalctl --vacuum-time=1s
    '';
    # myNixbuild = "nix-build -E 'with import <nixpkgs> {}; callPackage ./default.nix {}' ";
    # myPasswordGenerator = "date +%s | sha256sum | base64 | head -c 32 ; echo";
    myPasswordGenerator = "pwgen -c 30";

    Desktop = "cd ~/media/desktop";
    Downloads = "cd ~/downloads";
    Images = "cd ~/media/images";
    Documents = "cd ~/media/documents";
    Videos = "cd ~/media/videos";
    Music = "cd ~/media/music";
    # Public   = "~/media/public";
    # Template = "~/media/templates";
  };
}
