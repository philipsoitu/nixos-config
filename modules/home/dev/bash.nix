{ config, lib, pkgs, ... }:

{
  options.bash.enable = lib.mkEnableOption "Enable bash";

  config = lib.mkIf config.bash.enable {
    programs.bash = {
      enable = true;
    };
  };
}

