{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.school.enable = lib.mkEnableOption "Enable school";

  config = lib.mkIf config.school.enable {
    environment.systemPackages = [
      pkgs.typst
      pkgs.zathura
    ];
  };
}
