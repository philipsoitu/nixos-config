{ self, inputs, ... }:
{
  flake.nixosModules.bash =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.bash
      ];
    };

  perSystem =
    { pkgs, ... }:
    let
      bashrc = pkgs.writeText "bashrc" ''
        PS1="\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\$\[\033[0m\] "
        bind -x '"\C-f":tmux-sessionizer'
      '';
    in
    {
      packages.bash = pkgs.writeShellApplication {
        name = "bash";

        runtimeInputs = [
          self.packages.${pkgs.stdenv.hostPlatform.system}.tmux-sessionizer
        ];

        text = ''
          exec ${pkgs.bashInteractive}/bin/bash --init-file ${bashrc} "$@"
        '';
      };
    };
}
