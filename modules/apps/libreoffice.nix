{ self, inputs, ... }:
{
  flake.nixosModules.libreoffice =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.libreoffice-qt ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.libreoffice = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.libreoffice-qt;
      };
    };
}
