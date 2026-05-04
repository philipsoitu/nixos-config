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
        mkdir -p "$out/share"
        cp -r ${./../../wallpapers} "$out/share/wallpapers"
      '';

      currentWallpaper = "${wallpapers}/share/wallpapers/rose-pine/forest-5.jpg";
      hyprpaperConfig = pkgs.writeText "hyprpaper.conf" ''
        ipc = true
        splash = false

        wallpaper {
          monitor = eDP-1
          path = ${currentWallpaper}
        }

        wallpaper {
          monitor = DP-2
          path = ${currentWallpaper}
        }

        wallpaper {
          monitor = HDMI-A-1
          path = ${currentWallpaper}
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
