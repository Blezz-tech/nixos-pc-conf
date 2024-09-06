{ pkgs
, ...
}:
{
  gt-vein-info = (pkgs.callPackage ./gt-vein-info { });
  alvr = (pkgs.callPackage ./alvr { });
}
