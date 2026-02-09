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

  config = lib.mkIf config.laptop.enable {
    brightnessctl.enable = lib.mkDefault true;
    powersaving.enable = lib.mkDefault true;
  };
}
