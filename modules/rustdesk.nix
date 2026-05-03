{ self, inputs, ... }:
{
  flake.nixosModules.rustdesk =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.rustdesk
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.rustdesk = pkgs.rustdesk-flutter;
    };
}
