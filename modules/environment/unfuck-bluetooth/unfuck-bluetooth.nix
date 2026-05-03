{ self, inputs, ... }:
{
  flake.nixosModules.unfuck-bluetooth =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.unfuck-bluetooth
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.unfuck-bluetooth = pkgs.writeShellApplication {
        name = "unfuck-bluetooth";

        runtimeInputs = with pkgs; [
          coreutils
          util-linux
          systemd
          procps
          kmod
          bluez
          sudo
        ];

        text = builtins.readFile ./unfuck-bluetooth.sh;
      };
    };
}
