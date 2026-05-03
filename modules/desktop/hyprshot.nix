{ self, inputs, ... }:
{
  flake.nixosModules.hyprshot =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.hyprshot
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.hyprshot = pkgs.hyprshot;
    };
}
