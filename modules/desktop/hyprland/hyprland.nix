{ self, inputs, ... }:
{
  flake.nixosModules.hyprland =
    {
      pkgs,
      lib,
      ...
    }:
    let
      hyprlandConfig = self.packages.${pkgs.stdenv.hostPlatform.system}.hyprland-config;
    in
    {
      programs.hyprland = {
        enable = true;
        package = pkgs.hyprland;
      };

      environment.etc."xdg/hypr/hyprland.lua".source = hyprlandConfig;
    };

  perSystem =
    { pkgs, lib, ... }:
    let
      hyprlandConfig = pkgs.writeText "hyprland.lua" (builtins.readFile ./hyprland.lua);
    in
    {
      packages.hyprland-config = hyprlandConfig;

      packages.hyprland = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.hyprland;

        args = [
          "--config"
          "${hyprlandConfig}"
        ];

        runtimeInputs = with pkgs; [
          pkgs.brightnessctl
          self.packages.${pkgs.stdenv.hostPlatform.system}.waybar
          self.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper
          self.packages.${pkgs.stdenv.hostPlatform.system}.dunst
          ghostty
          kdePackages.dolphin
          self.packages.${pkgs.stdenv.hostPlatform.system}.wofi
          self.packages.${pkgs.stdenv.hostPlatform.system}.hyprshot
          wireplumber
          playerctl
        ];
      };
    };
}
