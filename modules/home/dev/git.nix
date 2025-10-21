{ config, lib, pkgs, ... }:

{
  options.git.enable = lib.mkEnableOption "Enable git";

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "philipsoitu";
          email = "philip.soitu@gmail.com";
        };

        init.defaultBranch = "main";
        core.editor = "nvim";
      };
    };
  };
}

