{ self, inputs, ... }:
{
  flake.nixosModules.hyprpaper =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper
      ];
    };

  perSystem =
    { pkgs, ... }:
    let
      lakeWallpaper = "${self.packages.${pkgs.stdenv.hostPlatform.system}.wallpapers}/share/wallpapers/lake.jpg";
      hyprpaperConfig = pkgs.writeText "hyprpaper.conf" ''
        preload = ${lakeWallpaper}

        wallpaper = eDP-1,${lakeWallpaper}
        wallpaper = DP-2,${lakeWallpaper}
        wallpaper = HDMI-A-1,${lakeWallpaper}
      '';
    in
    {
      packages.hyprpaper = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.hyprpaper;

        args = [
          "-c"
          "${hyprpaperConfig}"
        ];
      };
    };
}
