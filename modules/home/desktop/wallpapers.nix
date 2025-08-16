{ config, lib, pkgs, ...}:

{
  options.wallpapers.enable = lib.mkEnableOption "Enable wallpapers";

  config = lib.mkIf config.wallpapers.enable {
    home.file.".config/wallpapers/lake.jpg".source = ../../../wallpapers/lake.jpg;
    home.file.".config/wallpapers/berries.jpg".source = ../../../wallpapers/berries.jpg;
    home.file.".config/wallpapers/mushroom.jpg".source = ../../../wallpapers/mushroom.jpg;
  };
}
