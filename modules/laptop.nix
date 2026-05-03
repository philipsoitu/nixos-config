{ self, inputs, ... }:
{
  flake.nixosModules.laptop =
    { ... }:
    {
      imports = [
        self.nixosModules.brightnessctl
        self.nixosModules.powersaving
      ];
    };
}
