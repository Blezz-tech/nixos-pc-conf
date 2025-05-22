{ config, lib, pkgs, ... }:

let
  plasmaSystemMonitorWrapper = {
    source = "${pkgs.kdePackages.plasma-systemmonitor}/bin/plasma-systemmonitor";
    capabilities = "cap_net_raw+ep";
    owner = "root";
    group = "root";
  };
in
{
  options = {
    programs.plasma-systemmonitor = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable wrapper for plasma-systemmonitor with cap_net_raw capability";
      };

      wrapper = lib.mkOption {
        type = lib.types.attrsOf lib.types.anything;
        default = plasmaSystemMonitorWrapper;
        description = "Wrapper options for plasma-systemmonitor";
      };
    };
  };

  config = lib.mkIf config.programs.plasma-systemmonitor.enable {
    security.wrappers.plasma-systemmonitor = config.programs.plasma-systemmonitor.wrapper;
  };
}
