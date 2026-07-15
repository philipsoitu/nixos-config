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
      hyprpaperConfig = pkgs.writeText "hyprpaper.conf" ''
        ipc = true
        splash = false

        wallpaper {
          monitor = eDP-1
          path = ${self.theme.wallpaper}
        }

        wallpaper {
          monitor = DP-2
          path = ${self.theme.wallpaper}
        }

        wallpaper {
          monitor = HDMI-A-1
          path = ${self.theme.wallpaper}
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
