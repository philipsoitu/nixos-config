{ self, inputs, ... }:
{
  flake.nixosModules.wallpapers =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.wallpapers
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.wallpapers = pkgs.runCommand "wallpapers" { } ''
        mkdir -p "$out/share/wallpapers"
        ln -s ${./../../wallpapers/others/lake.jpg} "$out/share/wallpapers/lake.jpg"
        ln -s ${./../../wallpapers/others/berries.jpg} "$out/share/wallpapers/berries.jpg"
        ln -s ${./../../wallpapers/others/mushroom.jpg} "$out/share/wallpapers/mushroom.jpg"
      };
    };
}
