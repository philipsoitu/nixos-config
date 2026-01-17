{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.printer-3d.enable = lib.mkEnableOption "Enable printer-3d";

  config = lib.mkIf config.printer-3d.enable {
    environment.systemPackages = [
      pkgs.openscad
      pkgs.freecad
      pkgs.bambu-studio
    ];
  };
}
