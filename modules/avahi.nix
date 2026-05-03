{ self, inputs, ... }:
{
  flake.nixosModules.avahi =
    { ... }:
    {
      services.avahi = {
        enable = true;
        nssmdns4 = true;
      };
    };
}
