{ config, lib, pkgs, ... }:

{
  options.printer.enable = lib.mkEnableOption "Enable printer";

  config = lib.mkIf config.printer.enable {
    environment.systemPackages = [
      services.printing.enable = true;
      services.printing.drivers = [ pkgs.brlaser ];
    ];
  };
}
