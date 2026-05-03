{ self, inputs, ... }:
{
  flake.nixosModules.codex =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.codex
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.codex = pkgs.codex;
    };
}
