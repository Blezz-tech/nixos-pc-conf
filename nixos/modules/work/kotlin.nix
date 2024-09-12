{ pkgs
, ...
}:
{
  environment.systemPackages = [
    pkgs.kotlin
    pkgs.kotlin-language-server
    pkgs.kotlin-interactive-shell
    pkgs.jetbrains.idea-community-src
  ];
}
