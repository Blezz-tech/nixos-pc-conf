{ pkgs
, ...
}: {
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" "ru" "zh-CN" ];
    wrapperConfig = {
      pipewireSupport = true;
    };
    nativeMessagingHosts = {
      packages = [
        pkgs.kdePackages.plasma-browser-integration
      ];
    };
  };
}
