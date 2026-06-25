{ self, inputs, ... }:
{
  flake.nixosModules.apps =
    { ... }:
    {
      imports = [
        self.nixosModules.firefox
        self.nixosModules.chromium
        self.nixosModules.ghostty
        self.nixosModules.zathura
        self.nixosModules.orca-slicer
      ];
    };
}
