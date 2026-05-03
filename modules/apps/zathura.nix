{ self, inputs, ... }:
{
  perSystem =
    { pkgs, self', ... }:
    {
      packages.zathura = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.zathura;
      };
    };
}
