{
  xdg.configFile."chromium-flags.conf".text = ''
    --enable-blink-features=MiddleClickAutoscroll
    
    # "--proxy-server=http://127.0.0.1:3999"
    
    --use-gl=angle
    --use-angle=vulkan
    --ignore-gpu-blocklist
    --enable-gpu-rasterization
    --enable-zero-copy
    --enable-accelerated-video-decode
    --ozone-platform-hint=wayland
    --enable-features=Vulkan,VulkanFromANGLE,DefaultANGLEVulkan,VaapiIgnoreDriverChecks,VaapiVideoDecoder,AcceleratedVideoEncoder,UseMultiPlaneFormatForHardwareVideo,PlatformHEVCDecoderSupport,UseOzonePlatform

    # For Fcitx5
    --enable-wayland-ime
    --wayland-text-input-version=3
  '';

  xdg.configFile."vivaldi-stable.conf".text = ''
    "--enable-blink-features=MiddleClickAutoscroll"

    # "--proxy-server=http://127.0.0.1:3999"

    # "--use-gl=angle"
    # "--use-angle=vulkan"
    "--ignore-gpu-blocklist"
    # "--enable-gpu-rasterization"
    "--enable-zero-copy"
    # "--enable-accelerated-video-decode"
    # "--enable-features=Vulkan,VulkanFromANGLE,DefaultANGLEVulkan,VaapiIgnoreDriverChecks,VaapiVideoDecoder,AcceleratedVideoEncoder,UseMultiPlaneFormatForHardwareVideo,PlatformHEVCDecoderSupport"

    # For Fcitx5
    # "--enable-wayland-ime"
    # "--wayland-text-input-version=3"
  '';
}
