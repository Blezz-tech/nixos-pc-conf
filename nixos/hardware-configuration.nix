# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config
, lib
, modulesPath
, pkgs
, ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
    initrd.kernelModules = [ "amdgpu" ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];

    # <nixos-wiki>
    plymouth = {
      enable = true;
      theme = "target_2";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "target_2" ];
        })
      ];
    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 0;
    # </nixos-wiki>
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/4545236e-e7eb-41e1-8619-c8459a54a36e";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/54EB-7149";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  fileSystems."/run/media/jenya/disk_d" = {
    device = "/dev/disk/by-uuid/f23f662f-db3e-4fe8-aa13-8597b4b168a7";
    fsType = "ext4";
  };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp6s0.useDHCP = lib.mkDefault true;


  # оптимизация для процессора
  nixpkgs.hostPlatform = lib.mkDefault {
    # gcc.arch = "alderlake";
    # gcc.tune = "alderlake";
    system = "x86_64-linux";
  };


  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = [
      pkgs.amdvlk
      # pkgs.rocmPackages.clr.icd # OpenCL
    ];
    extraPackages32 = [
      pkgs.driversi686Linux.amdvlk
    ];
    # extraPackages = with pkgs; [
    #   intel-media-driver # LIBVA_DRIVER_NAME=iHD
    #   vaapiIntel # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
    #   vaapiVdpau
    #   libvdpau-va-gl
    # ];
  };

  environment.variables = {
    # Use radv
    # AMD_VULKAN_ICD = "RADV";

    # USE amdvlk
    VK_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/radeon_icd.x86_64.json";
  };
}
