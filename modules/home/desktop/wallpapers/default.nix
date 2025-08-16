{ config, lib, pkgs, ...}:

{
  options.wallpapers.enable = lib.mkEnableOption "Enable wallpapers";

  config = lib.mkIf config.wallpapers.enable {
    home.file.".config/wallpaper/lake.jpg".source = ./lake.jpg
    home.file.".config/wallpaper/berries.jpg".source = ./berries.jpg
    home.file.".config/wallpaper/mushroom.jpg".source = ./mushroom.jpg
  };
}
