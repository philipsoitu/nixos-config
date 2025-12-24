{
  config,
  lib,
  pkgs,
  ...
}:

{

  options.laptop.enable = lib.mkEnableOption "Enable laptop specific configurations";

  imports = [
    ./brightnessctl.nix
    ./powersaving.nix
  ];

  config = lib.mkIf config.hyprland.enable {
    brightnessctl.enable = true;
    powersaving.enable = true;

  };
}
