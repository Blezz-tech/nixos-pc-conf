{
  programs.gnupg = {
    agent = {
      enable = true;
      # SSH_AUTH_SOCK указывает на gpg-agent: ключи для git и ssh берутся из GPG,
      # отдельных ~/.ssh/id_* нет
      enableSSHSupport = true;
      enableBrowserSocket = true;
    };
    dirmngr.enable = true;
  };
}
