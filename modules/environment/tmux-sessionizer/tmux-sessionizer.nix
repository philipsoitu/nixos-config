{ self, inputs, ... }:
{
  flake.nixosModules.tmux-sessionizer =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.tmux-sessionizer
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.tmux-sessionizer = pkgs.writeShellApplication {
        name = "tmux-sessionizer";

        runtimeInputs = with pkgs; [
          fzf
          self.packages.${pkgs.stdenv.hostPlatform.system}.tmux
          findutils
          coreutils
          procps
        ];

        text = builtins.readFile ./tmux-sessionizer.sh;
      };
    };
}
