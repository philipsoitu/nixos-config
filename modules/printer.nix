{ self, inputs, ... }:
{
  flake.nixosModules.printer =
    { pkgs, ... }:
    {
      services.printing.enable = true;
      services.printing.drivers = [ pkgs.brlaser ];
    };
}
