{ config, lib, pkgs, ... }:

{
  options.git.enable = lib.mkEnableOption "Enable git";

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "philipsoitu";
      userEmail = "philip.soitu@gmail.com";
    };
  };
}

