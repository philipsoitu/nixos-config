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
      wallpapers = pkgs.runCommand "hyprpaper-wallpapers" { } ''
        mkdir -p "$out/share/wallpapers"
        ln -s ${./../../wallpapers/others/lake.jpg} "$out/share/wallpapers/lake.jpg"
        ln -s ${./../../wallpapers/others/berries.jpg} "$out/share/wallpapers/berries.jpg"
        ln -s ${./../../wallpapers/others/mushroom.jpg} "$out/share/wallpapers/mushroom.jpg"
      '';

      lakeWallpaper = "${wallpapers}/share/wallpapers/lake.jpg";
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
