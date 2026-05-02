{ self, inputs, ... }:
{
  flake.nixosModules.environment =
    { ... }:
    {
      imports = [
        self.nixosModules.git
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.environment = pkgs.writeShellApplication {
        name = "environment";

        runtimeInputs = [
          self.packages.${pkgs.stdenv.hostPlatform.system}.git
        ];

        text = ''
          shell="''${SHELL:-${pkgs.bashInteractive}/bin/bash}"
          exec "$shell" -i
        '';
      };
    };
}
