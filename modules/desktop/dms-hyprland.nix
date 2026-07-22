{ self, inputs, ... }:
{
  flake.nixosModules.dms-hyprland =
    { ... }:
    {
      imports = [
        self.nixosModules.pipewire
        self.nixosModules.hyprcursor
        self.nixosModules.hyprland
        self.nixosModules.hyprshot
        self.nixosModules.wofi
        self.nixosModules.dms-shell
      ];
    };

}
