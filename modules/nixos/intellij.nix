{ config, pkgs, lib, ... }:

{
  options.intellij.enable = lib.mkEnableOption "Enable intellij";

  config = lib.mkIf config.intellij.enable {
    environment.systemPackages = [
      pkgs.jetbrains.idea-ultimate
    ];
  };
}
