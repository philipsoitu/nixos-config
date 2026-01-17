{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.intellij.enable = lib.mkEnableOption "Enable intellij";

  config = lib.mkIf config.school.enable {
    environment.systemPackages = [
      pkgs.jetbrains.idea
      pkgs.jdk21
      pkgs.openjfx
    ];
  };
}
