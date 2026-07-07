{ self, inputs, ... }:
{
  flake.nixosModules.lazygit =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.lazygit
      ];
    };

  perSystem =
    { pkgs, self', ... }:
    {
      packages.lazygit = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.lazygit;

        runtimeInputs = [
          self'.packages.git
        ];
      };
    };
}
