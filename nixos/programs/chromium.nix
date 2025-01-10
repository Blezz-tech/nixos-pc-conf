{
  programs.chromium = {
    enable = true;
    extraOpts = {
      "SpellcheckEnabled" = true;
      "SpellcheckLanguage" = [
        "en-US"
        "ru"
        "zh-CN"
      ];
    };
    enablePlasmaBrowserIntegration = true;
  };
}
