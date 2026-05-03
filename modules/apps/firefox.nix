{ self, inputs, ... }:
{
  flake.nixosModules.firefox =
    { pkgs, ... }:
    {
      programs.firefox.enable = true;
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.firefox = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.firefox;
      };
    };
}
