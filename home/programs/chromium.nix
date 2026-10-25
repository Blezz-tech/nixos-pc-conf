{
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      # "--enable-blink-features=MiddleClickAutoscroll"

      "--use-gl=angle"
      "--use-angle=vulkan"
      "--ignore-gpu-blocklist"
      "--enable-gpu-rasterization"
      "--enable-zero-copy"
      "--enable-accelerated-video-decode"
      "--ozone-platform-hint=wayland"
      "--enable-features=VaapiVideoDecoder,AcceleratedVideoEncoder,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE,UseMultiPlaneFormatForHardwareVideo,PlatformHEVCDecoderSupport,UseOzonePlatform,AcceleratedVideoDecodeLinuxZeroCopyGL"

      # For Fcitx5
      "--enable-wayland-ime=true"
      "--wayland-text-input-version=3"
    ];
  };
}
