{ config, lib, pkgs, ... }:

{
  options.hyprpaper.enable = lib.mkEnableOption "Enable hyprpaper";

  config = lib.mkIf config.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;

      settings = {
        preload = [
          "home/phil/.config/wallpaper/lake.jpg"
        ];

        wallpaper = [
          "eDP-1, /home/phil/.config/wallpapers/lake.jpg"
          "DP-2, /home/phil/.config/wallpapers/lake.jpg"
          "HDMI-A-1, /home/phil/.config/wallpapers/lake.jpg"
        ];
      };
    };
  };
}
