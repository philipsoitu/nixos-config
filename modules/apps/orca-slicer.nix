{ self, inputs, ... }:
{
  flake.nixosModules.orca-slicer =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.orca-slicer
      ];
    };

  perSystem =
    { pkgs, self', ... }:
    {
      packages.orca-slicer = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.orca-slicer;
      };
    };
}
