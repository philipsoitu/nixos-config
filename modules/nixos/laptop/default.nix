{ config, lib, pkgs, ... }:

{
  options.laptop.enable = lib.mkEnableOption "Enable laptop specific configurations";

  config = lib.mkIf config.hyprland.enable {
    imports = [
      ./brightnessctl.nix
      ./powersaving.nix
    ];

    brightnessctl.enable = true;
    powersaving.enable = true;


  };
}
