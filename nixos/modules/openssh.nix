{
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg = {
    agent = {
      enable = true;
      enableSSHSupport = true;
      enableBrowserSocket = true;
    };
    dirmngr.enable = true;
  };

  # Enable the OpenSSH daemon.
  # services.openssh = {
  #   enable = true;
  #   ports = [ 22 ];
  #   settings.PasswordAuthentication = false;
  #   settings.KbdInteractiveAuthentication = false;
  # };
}
