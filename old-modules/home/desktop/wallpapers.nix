{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.wallpapers.enable = lib.mkEnableOption "Enable wallpapers";

  config = lib.mkIf config.wallpapers.enable {
    home.file.".config/wallpapers/lake.jpg".source = ../../../wallpapers/others/lake.jpg;
    home.file.".config/wallpapers/berries.jpg".source = ../../../wallpapers/others/berries.jpg;
    home.file.".config/wallpapers/mushroom.jpg".source = ../../../wallpapers/others/mushroom.jpg;
  };
}
