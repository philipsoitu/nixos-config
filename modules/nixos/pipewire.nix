{ config, lib, pkgs, ... }:

{
  options.pipewire.enable = lib.mkEnableOption "Enable pipewire";

  config = lib.mkIf config.pipewire.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
