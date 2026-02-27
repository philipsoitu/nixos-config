{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.codex.enable = lib.mkEnableOption "Enable codex";

  config = lib.mkIf config.codex.enable {
    home.packages = [
      pkgs.codex
    ];
  };
}
