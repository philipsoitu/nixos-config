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
      waybarConfig = pkgs.writeText "waybar-config.jsonc" (builtins.readFile ./waybar-config.jsonc);
      waybarStyle = pkgs.writeText "waybar-style.css" (builtins.readFile ./waybar-style.css);
    in
    {
      packages.waybar = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.waybar;

        args = [
          "--config"
          "${waybarConfig}"
          "--style"
          "${waybarStyle}"
        ];

        runtimeInputs = with pkgs; [
          pavucontrol
        ];
      };
    };
}
