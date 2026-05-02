{ self, inputs, ... }:
{
  flake.nixosModules.sddm =
    { pkgs, ... }:
    {
      services.xserver.enable = true;

      services.displayManager = {
        defaultSession = "hyprland";
        sddm = {
          enable = true;
          package = self.packages.${pkgs.stdenv.hostPlatform.system}.sddm;
          wayland.enable = true;
          theme = "breeze";
        };
      };
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.sddm = pkgs.kdePackages.sddm;
    };
}
