{ self, inputs, ... }:
{
  flake.nixosConfigurations.shellbox = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.shellboxConfiguration
    ];
  };
}
