{ self, inputs, ... }:
{
  flake.nixosModules.firefox =
    { pkgs, ... }:
    {
      programs.firefox.enable = true;
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.firefox = pkgs.firefox;
    };
}
