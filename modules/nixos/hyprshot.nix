{ config, lib, pkgs, ... }:

{
  options.hyprshot.enable = lib.mkEnableOption "Enable hyprshot";

  config = lib.mkIf config.hyprshot.enable {
    environment.systemPackages = [
      pkgs.hyprshot
    ];
  };
}
