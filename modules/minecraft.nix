{ self, inputs, ... }:
{
  flake.nixosModules.minecraft =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.minecraft
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.minecraft = pkgs.symlinkJoin {
        name = "minecraft";
        paths = with pkgs; [
          prismlauncher
          jdk21
          jdk17
        ];
      };
    };
}
