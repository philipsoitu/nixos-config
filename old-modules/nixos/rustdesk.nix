{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.rustdesk.enable = lib.mkEnableOption "Enable rustdesk";

  config = lib.mkIf config.rustdesk.enable {
    environment.systemPackages = [
      pkgs.rustdesk-flutter
    ];
  };
}
