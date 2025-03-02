{
  services.xserver = {
    enable = true;
    # videoDrivers = [ "amdgpu" ];

    # Configure keymap in X11
    xkb.layout = "us,ru";
    xkb.variant = "";
  };
}