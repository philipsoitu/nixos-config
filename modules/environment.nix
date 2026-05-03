{ self, inputs, ... }:
{
  flake.nixosModules.environment =
    { ... }:
    {
      imports = [
        self.nixosModules.git
        self.nixosModules.neovim
        self.nixosModules.tmux
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.environment = pkgs.writeShellApplication {
        name = "environment";

        runtimeInputs = [
          self.packages.${pkgs.stdenv.hostPlatform.system}.git
          self.packages.${pkgs.stdenv.hostPlatform.system}.neovim
          self.packages.${pkgs.stdenv.hostPlatform.system}.tmux
        ];

        text = ''
          shell="''${SHELL:-${pkgs.bashInteractive}/bin/bash}"
          exec "$shell" -i
        '';
      };
    };
}
