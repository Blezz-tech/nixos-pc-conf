{
  services.pulseaudio.enable = false;

  hardware.bluetooth.enable = true;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    audio.enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;

    wireplumber.enable = true;

    # extraConfig.pipewire = {
    #   "alsa.blacklist" = [ "snd_hda_codec_hdmi" ];
    # };

    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };
}
