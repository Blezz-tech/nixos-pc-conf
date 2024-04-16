{ config
, ...
}: {
  imports = [
    ./starship.nix
    ./alacritty.nix
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your cusotm bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      # myConf = "cd ~/nixos-pc-conf";
      # myViewConf = "cd myConf && nvim .";
      # myGit = "~/git-repos";
      # myServicesOption = "nixos-option services";
      myBuildSystem = "sudo nixos-rebuild switch --show-trace --flake ~/nixos-pc-conf#laptop-full";
      myErrors = "journalctl -p 3 -xb";
      myGenerations = "nix profile history --profile /nix/var/nix/profiles/system";
      myDeleteGenerations = ''
        sudo nix profile wipe-history --profile /nix/var/nix/profiles/system
        nix profile wipe-history --profile ~/.local/state/nix/profiles/home-manager
      '';
      myClear = ''
        sudo nix store gc
        sudo nix store optimise
      '';
      myClearHistory = ''
        sudo journalctl --rotate
        sudo journalctl --vacuum-time=1s
      '';

      Desktop = "cd ~/media/desktop";
      Downloads = "cd ~/downloads";
      Images = "cd ~/media/images";
      Documents = "cd ~/media/documents";
      Videos = "cd ~/media/videos";
      Music = "cd ~/media/music";
      # Public   = "~/media/public";
      # Template = "~/media/templates";
    };
  };
}
