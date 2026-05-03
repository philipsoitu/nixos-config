{ self, inputs, ... }:
{
  flake.nixosModules.wofi =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.wofi
      ];
    };

  perSystem =
    { pkgs, ... }:
    let
      wofiConfig = pkgs.writeText "wofi.conf" ''
        show=drun
        term=ghostty
        allow_markup=true
      '';

      wofiStyle = pkgs.writeText "wofi.css" ''
        window {
          margin: 0px;
          border: 1px solid #928374;
          background-color: #282828;
        }

        #input {
          margin: 5px;
          border: none;
          color: #ebdbb2;
          background-color: #1d2021;
        }

        #inner-box {
          margin: 5px;
          border: none;
          background-color: #282828;
        }

        #outer-box {
          margin: 5px;
          border: none;
          background-color: #282828;
        }

        #scroll {
          margin: 0px;
          border: none;
        }

        #text {
          margin: 5px;
          border: none;
          color: #ebdbb2;
        }

        #entry:selected {
          background-color: #1d2021;
        }
      '';
    in
    {
      packages.wofi = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.wofi;

        flags = {
          "--conf" = "${wofiConfig}";
          "--style" = "${wofiStyle}";
        };
      };
    };
}
