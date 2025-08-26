{ config, lib, pkgs, ... }:

{
  options.tmux.enable = lib.mkEnableOption "Enable tmux";

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;

      extraConfig = ''
        set -g base-index 1
        setw -g pane-base-index 1

        bind -n M-1 select-window -t 1
        bind -n M-2 select-window -t 2
        bind -n M-3 select-window -t 3
        bind -n M-4 select-window -t 4
        bind -n M-5 select-window -t 5
        bind -n M-6 select-window -t 6
        bind -n M-7 select-window -t 7
        bind -n M-8 select-window -t 8
        bind -n M-9 select-window -t 9
        bind -n M-0 select-window -t 10

      '';
    };
  };
}

