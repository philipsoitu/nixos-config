{ config, lib, pkgs, ... }:

{
  options.ghostty.enable = lib.mkEnableOption "Enable ghostty";

  config = lib.mkIf config.ghostty.enable {
    programs.ghostty = {
      enable = true;

      settings = {
        theme = "GruvboxDark";
        background-opacity = 0.7;

        font-size = 13;
        window-inherit-font-size = true;


        window-padding-balance = true;
        window-padding-x = 0;
        window-padding-y = 0;
      };
    };
  };
}

