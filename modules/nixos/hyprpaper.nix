{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.hyprpaper.enable = lib.mkEnableOption "Enable hyprpaper";

  config = lib.mkIf config.hyprpaper.enable {
    environment.systemPackages = [
      pkgs.hyprpaper
    ];
  };
}
