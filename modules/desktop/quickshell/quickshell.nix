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
    let
      quickshellConfig = pkgs.runCommand "quickshell-config" { } ''
        mkdir -p "$out"
        cp ${./shell.qml} "$out/shell.qml"
        cp ${./HyprlandWorkspaces.qml} "$out/HyprlandWorkspaces.qml"
      '';
    in
    {
      packages.quickshell = pkgs.writeShellApplication {
        name = "quickshell";

        runtimeInputs = [
          pkgs.quickshell
        ];

        text = ''
          exec qs -p ${quickshellConfig} "$@"
        '';
      };
    };
}
