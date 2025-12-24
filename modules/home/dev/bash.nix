{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.bash.enable = lib.mkEnableOption "Enable bash";

  config = lib.mkIf config.bash.enable {
    programs.bash = {
      enable = true;

      initExtra = ''
        # Prompt
        PS1="\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$\[\033[0m\] "

        # Ctrl+F tmux-sessionizer
        bind -x '"\C-f":tmux-sessionizer'
      '';
    };
  };
}
