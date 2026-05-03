{ self, inputs, ... }:
{
  flake.nixosModules.school =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.school
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.school = pkgs.symlinkJoin {
        name = "school";
        paths = with pkgs; [
          typst
          zathura
        ];
      };
    };
}
