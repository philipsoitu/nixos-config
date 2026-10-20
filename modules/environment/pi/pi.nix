{ self, ... }:
{
  flake.nixosModules.pi =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.pi
      ];
    };

  perSystem =
    { pkgs, ... }:
    let
      models = ./models.json;
      selectedTheme = self.theme.pi;
      selectedThemeName = (builtins.fromJSON (builtins.readFile selectedTheme)).name;
    in
    {
      packages.pi = pkgs.writeShellApplication {
        name = "pi";

        runtimeInputs = [
          pkgs.pi-coding-agent
          pkgs.wl-clipboard
        ];

        text = ''
          mkdir -p "$HOME/.pi/agent/themes"

          cp -f ${models} "$HOME/.pi/agent/models.json"
          cp -f ${selectedTheme} "$HOME/.pi/agent/themes/${selectedThemeName}.json"

          if [ -r "$HOME/.pi/agent/ica.env" ]; then
            set -a
            # shellcheck disable=SC1091
            . "$HOME/.pi/agent/ica.env"
            set +a
          fi

          exec ${pkgs.pi-coding-agent}/bin/pi --use-theme ${selectedThemeName} "$@"
        '';
      };
    };
}
