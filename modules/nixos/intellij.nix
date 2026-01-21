{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.intellij.enable = lib.mkEnableOption "Enable intellij";

  config = lib.mkIf config.school.enable {
    nixpkgs.config.permittedInsecurePackages = [
      "gradle-7.6.6"
    ];
    environment.systemPackages = [
      pkgs.jetbrains.idea
      pkgs.jdk21
      pkgs.openjfx
    ];
  };
}
