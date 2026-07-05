{ self, inputs, ... }:
{
  flake.nixosModules.freecad =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.freecad ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.freecad = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.freecad;
      };
    };
}
