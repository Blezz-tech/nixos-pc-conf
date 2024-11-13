{ pkgs
, ...
}:
{
  programs.alvr = {
    enable = true;
    openFirewall = true;
    package = pkgs.blezz-pkgs.alvr;
  };

  # services.monado = {
  #   enable = true;
  #   defaultRuntime = true; # Register as default OpenXR runtime
  # };

  # systemd.user.services.monado.environment = {
  #   STEAMVR_LH_ENABLE = "1";
  #   XRT_COMPOSITOR_COMPUTE = "1";
  # };
}
