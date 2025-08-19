{ config, lib, pkgs, ... }:

{
  options.bash.enable = lib.mkEnableOption "Enable bash";

  config = lib.mkIf config.bash.enable {
    programs.bash = {
      enable = true;

      bashrcExtra = ''
        if [ -n "$SSH_CONNECTION" ]; then
          export TERM=xterm-256color
        fi
      '';
    };
  };
}

