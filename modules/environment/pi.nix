{ self, inputs, ... }:
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
      models = pkgs.writeText "pi-models.json" (
        builtins.toJSON {
          providers.ollama = {
            baseUrl = "http://desktop:11434/v1";
            api = "openai-completions";
            apiKey = "ollama";
            models = [
              { id = "gemma4:e2b-it-qat"; }
            ];
          };
        }
      );
    in
    {
      packages.pi = pkgs.writeShellApplication {
        name = "pi";

        runtimeInputs = [
          pkgs.pi-coding-agent
        ];

        text = ''
          mkdir -p "$HOME/.pi/agent"
          cp -f ${models} "$HOME/.pi/agent/models.json"
          exec ${pkgs.pi-coding-agent}/bin/pi "$@"
        '';
      };
    };
}
