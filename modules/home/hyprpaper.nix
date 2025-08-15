{ config, lib, pkgs, ... }:

{
  options.hyprpaper.enable = lib.mkEnableOption "Enable hyprpaper";

  config = lib.mkIf config.hyprpaper.enable {
    home.file.".config/hypr/hyprpaper.conf".text = ''
      preload = /home/phil/.config/wallpapers/lake.jpg

      wallpaper = eDP-1, /home/phil/.config/wallpapers/lake.jpg
      wallpaper = DP-2, /home/phil/.config/wallpapers/lake.jpg
      wallpaper = HDMI-A-1, /home/phil/.config/wallpapers/lake.jpg
    '';
  };
}
