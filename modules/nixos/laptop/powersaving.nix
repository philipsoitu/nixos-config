{ config, lib, pkgs, ... }:

{
  options.powersaving.enable = lib.mkEnableOption "Enable powersaving mode";

  config = lib.mkIf config.hyprland.enable {
    services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
      };
    };
  };
}
