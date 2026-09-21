{ ... }:
{
  flake.nixosModules.logiops =
    { ... }:
    {
      hardware.bluetooth.enable = true;

      services.logiops = {
        enable = true;
        config = {
          devices = [
            {
              name = "MX Master 4";
              dpi = 600;
            }
          ];
        };
      };
    };
}
