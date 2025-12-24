{
  config,
  pkgs,
  lib,
  ...
}:

{
  options.rpi-imager.enable = lib.mkEnableOption "Enable rpi-imager";

  config = lib.mkIf config.rpi-imager.enable {
    environment.systemPackages = [
      pkgs.rpi-imager
      pkgs.qt5.qtbase
      pkgs.qt5.qtwayland
      pkgs.qt5.qttools
      pkgs.xorg.libX11
      pkgs.xorg.libXcursor
    ];
  };
}
