{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.minecraft.enable = lib.mkEnableOption "Enable minecraft";

  config = lib.mkIf config.minecraft.enable {
    environment.systemPackages = [
      pkgs.prismlauncher
    ];
  };
}
