{
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      # "--enable-blink-features=MiddleClickAutoscroll"

      # ANGLE over Vulkan
      # "--use-gl=angle"
      # "--use-angle=vulkan"

      # GPU raster / zero-copy
      "--enable-gpu-rasterization"
      "--enable-zero-copy"

      # VA-API decode + encode
      "--enable-accelerated-video-decode"
      "--enable-features=VaapiVideoDecoder,AcceleratedVideoEncoder"

      # Wayland
      "--ozone-platform-hint=wayland"

      # For Fcitx5
      "--enable-wayland-ime=true"
      "--wayland-text-input-version=3"
    ];
  };
}
