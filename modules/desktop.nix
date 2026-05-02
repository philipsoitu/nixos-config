{ self, inputs, ... }:
{
  flake.nixosModules.desktop =
    { ... }:
    {
      imports = [
        self.nixosModules.hyprland
        self.nixosModules.hyprpaper
        self.nixosModules.sddm
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.desktop = self.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    };
}
