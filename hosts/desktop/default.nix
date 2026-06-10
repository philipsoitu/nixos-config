{ self, inputs, ... }:
{
  flake.nixosConfigurations.dekstop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.desktopConfiguration
    ];
  };
}
