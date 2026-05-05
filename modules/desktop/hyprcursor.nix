{ self, inputs, ... }:
{
  flake.nixosModules.hyprcursor =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.hyprcursor
      ];

      environment.sessionVariables = {
        HYPRCURSOR_THEME = "rose-pine-hyprcursor";
        HYPRCURSOR_SIZE = "24";
        XCURSOR_THEME = "rose-pine-hyprcursor";
        XCURSOR_SIZE = "24";
      };
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.hyprcursor = pkgs.rose-pine-hyprcursor;
    };
}
