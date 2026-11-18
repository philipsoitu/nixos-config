{ self, inputs, ... }:
{
  flake.nixosModules.paseo-desktop =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.paseo-desktop ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.paseo-desktop = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.paseo-desktop;
      };
    };
}
