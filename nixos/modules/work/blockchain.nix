{ pkgs
, ...
}:
{
  environment.systemPackages = [
    pkgs.solc-select
  ];
}
