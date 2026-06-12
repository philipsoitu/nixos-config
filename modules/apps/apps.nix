{ self, inputs, ... }:
{
  flake.nixosModules.apps =
    { ... }:
    {
      imports = [
        self.nixosModules.firefox
        self.nixosModules.ghostty
        self.nixosModules.zathura
      ];
    };
}
