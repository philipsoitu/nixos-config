{ self, inputs, ... }:
{
  flake.nixosModules.brightnessctl =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.brightnessctl
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.brightnessctl = pkgs.brightnessctl;
    };
}
