{ self, inputs, ... }:
{
  flake.nixosModules.waybar =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.waybar
      ];

      fonts.packages = [
        pkgs.nerd-fonts.jetbrains-mono
      ];
    };

  perSystem =
    { pkgs, ... }:
    let
      config = pkgs.writeText "waybar-config.jsonc" (builtins.readFile self.theme.waybar.config);
      style = pkgs.writeText "waybar-style.css" (builtins.readFile self.theme.waybar.style);
    in
    {
      packages.waybar = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.waybar;

        args = [
          "--config"
          "${config}"
          "--style"
          "${style}"
        ];

        runtimeInputs = with pkgs; [
          pavucontrol
        ];
      };
    };
}
