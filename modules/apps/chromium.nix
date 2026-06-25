{ self, inputs, ... }:
{
  flake.nixosModules.chromium =
    { pkgs, ... }:
    {
      programs.chromium.enable = true;

      environment.systemPackages = [ pkgs.chromium ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.chromium = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.chromium;
      };
    };
}
