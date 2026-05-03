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
        ipc = true
        splash = false

        wallpaper {
          monitor = eDP-1
          path = ${lakeWallpaper}
        }

        wallpaper {
          monitor = DP-2
          path = ${lakeWallpaper}
        }

        wallpaper {
          monitor = HDMI-A-1
          path = ${lakeWallpaper}
        }
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
