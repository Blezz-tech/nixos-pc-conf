{ lib
, ...
}: {
  # specialisation."no-sddm".configuration = {
  #   services.displayManager.sddm.enable = lib.mkForce false;
  # };

  # specialisation."printing".configuration = {
  #   imports = [
  #     ./print_and_scan.nix
  #   ];
  # };
}
