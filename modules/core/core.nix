{ self, inputs, ... }:
{
  flake.nixosModules.core =
    { ... }:
    {
      imports = [
        self.nixosModules.boot
        self.nixosModules.i18n
        self.nixosModules.logiops
        self.nixosModules.users
        self.nixosModules.settings
        self.nixosModules.tailscale
      ];
    };
}
