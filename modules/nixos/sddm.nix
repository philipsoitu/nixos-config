{ config, lib, pkgs, ... }:

{
  options.sddm.enable = lib.mkEnableOption "Enable sddm";

  config = lib.mkIf config.sddm.enable {
    services.xserver.enable = true;

    services.displayManager = {
      defaultSession = "hyprland";
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "breeze";
      };
    };
  };
}
