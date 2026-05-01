{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.brightnessctl.enable = lib.mkEnableOption "Enable brightnessctl";

  config = lib.mkIf config.brightnessctl.enable {
    environment.systemPackages = [
      pkgs.brightnessctl
    ];
  };
}
