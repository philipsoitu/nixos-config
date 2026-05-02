{ self, inputs, ... }:
{
  flake.nixosModules.terminal =
    { ... }:
    {
      imports = [
        self.nixosModules.environment
        self.nixosModules.ghostty
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.terminal = pkgs.writeShellApplication {
        name = "terminal";

        runtimeInputs = [
          self.packages.${pkgs.stdenv.hostPlatform.system}.ghostty
          self.packages.${pkgs.stdenv.hostPlatform.system}.git
        ];

        text = ''
          exec ghostty "$@"
        '';
      };
    };
}
