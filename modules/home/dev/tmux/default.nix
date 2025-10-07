{ config, lib, pkgs, ... }:

{
  options.tmux.enable = lib.mkEnableOption "Enable tmux";

  config = lib.mkIf config.tmux.enable {
    programs.tmux = {
      enable = true;
      shortcut = "SPACE";
      terminal = "tmux-256color";
      baseIndex = 1;
      clock24 = true;
      escapeTime = 0;
      keyMode = "vi";
      extraConfig = ''
        set -a terminal-features "tmux-256color:RGB"
        set -g renumber-windows on
        set -g status-position top
        set -g pane-base-index 1
        set -g status-justify absolute-centre
        set -g status-style "bg=default"
        set -g window-status-current-style "fg=blue bold"
        set -g status-interval 5
        set -g status-right '#{?client_prefix, _ ,}#(timew | awk "/^ *Total/ {print \$NF}") #[bg=green,fg=black,bold]#(timew | awk "/^ *Tracking/ {print \" \" \$NF \" \"}")#[bg=default]'
        set -g status-left "#S"
        set -g mouse on

        bind -n M-1 select-window -t 1
        bind -n M-2 select-window -t 2
        bind -n M-3 select-window -t 3
        bind -n M-4 select-window -t 4
        bind -n M-5 select-window -t 5
        bind -n M-6 select-window -t 6
        bind -n M-7 select-window -t 7
        bind -n M-8 select-window -t 8
        bind -n M-0 select-window -t 10
        bind -n M-9 select-window -t 9
      '';
    };
  };
}

