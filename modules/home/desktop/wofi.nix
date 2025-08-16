{ config, lib, pkgs, ... }:

{
  options.wofi.enable = lib.mkEnableOption "Enable wofi";

  config = lib.mkIf config.wofi.enable {
    programs.wofi = {
      enable = true;

      settings = {
        
      };
    };
  };
}
