{ pkgs
, ...
}:
{
  gt-vein-info = (pkgs.callPackage ./gt-vein-info { });
  kando = (pkgs.callPackage ./kando { });
}
