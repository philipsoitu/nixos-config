{ self, inputs, ... }:
{
  flake.nixosModules.tmux =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.tmux
      ];
    };

  perSystem =
    { pkgs, ... }:
    let
      tmuxConfig = pkgs.writeText "tmux.conf" ''
        unbind C-b
        set -g prefix Space
        bind Space send-prefix

        set -g default-terminal "tmux-256color"
        set -g base-index 1
        setw -g pane-base-index 1
        set -g clock-mode-style 24
        set -sg escape-time 0
        set -g status-keys vi
        set -g mode-keys vi

        set -a terminal-features "tmux-256color:RGB"
        set -g renumber-windows on
        set -g status-position top
        set -g status-justify absolute-centre
        set -g status-style "bg=default"
        set -g window-status-current-style "fg=blue bold"
        set -g status-interval 5
        set -g status-right '#{?client_prefix, _ ,}#(timew | awk "/^ *Total/ {print \$NF}") #[bg=green,fg=black,bold]#(timew | awk "/^ *Tracking/ {print " " \$NF " "}")#[bg=default]'
        set -g status-left "#S"
        set -g mouse on
        set -g focus-events on

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
    in
    {
      packages.tmux = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.tmux;

        flags = {
          "-f" = "${tmuxConfig}";
        };

        runtimeInputs = with pkgs; [
          timewarrior
          gawk
        ];
      };
    };
}
