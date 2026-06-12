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
      theme = ./theme.json;
    in
    {
      packages.pi = pkgs.writeShellApplication {
        name = "pi";

        runtimeInputs = [
          pkgs.pi-coding-agent
        ];

        text = ''
          mkdir -p "$HOME/.pi/agent/themes"
          cp -f ${models} "$HOME/.pi/agent/models.json"
          cp -f ${theme} "$HOME/.pi/agent/themes/rose-pine.json"
          exec ${pkgs.pi-coding-agent}/bin/pi "$@"
        '';
      };
    };
}
