{ self, ... }:
{
  flake.nixosModules.quickshell =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.quickshell
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.quickshell = pkgs.writeShellApplication {
        name = "quickshell";

        runtimeInputs = [
          pkgs.quickshell
        ];

        text = ''
          exec qs -p ${./shell.qml} "$@"
        '';
      };
    };
}
