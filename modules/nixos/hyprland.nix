{ config, lib, pkgs, ... }:

{
  options.hyprland.enable = lib.mkEnableOption "Enable hyprland";

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
}
