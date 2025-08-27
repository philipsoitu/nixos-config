{ config, lib, pkgs, ... }:

{
  options.tmux.enable = lib.mkEnableOption "Enable tmux";

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
    };
    home.file.".tmux.conf".source = ./tmux.conf;
  };
}

