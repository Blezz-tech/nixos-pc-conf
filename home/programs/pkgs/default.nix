{ pkgs
, ...
}:
{
  gt-vein-info = (pkgs.callPackage ./gt-vein-info { });
  voxelengine-cpp = (pkgs.callPackage ./voxelengine-cpp { });
}
