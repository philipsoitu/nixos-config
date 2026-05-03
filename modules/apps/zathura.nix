{ self, inputs, ... }:
{
  flake.nixosModules.zathura =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.zathura
      ];
    };

  perSystem =
    { pkgs, self', ... }:
    {
      packages.zathura = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.zathura;
      };
    };
}
