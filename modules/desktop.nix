{ self, inputs, ... }:
{
  flake.nixosModules.desktop =
    { ... }:
    {
      imports = [
        self.nixosModules.dunst
        self.nixosModules.hyprland
        self.nixosModules.hyprpaper
        self.nixosModules.hyprshot
        self.nixosModules.waybar
        self.nixosModules.wofi
        self.nixosModules.sddm
      ];
    };

  perSystem =
    { pkgs, self', ... }:
    {
      packages.desktop = self'.hyprland;
    };
}
