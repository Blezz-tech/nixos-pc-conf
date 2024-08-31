{ pkgs
, ...
}: {
  programs.chromium = {
    enable = true;
    package = pkgs.vivaldi;
    commandLineArgs = [
      "--disable-features=AllowQt"
      "--enable-blink-features=MiddleClickAutoscroll"
    ];
  };
}
