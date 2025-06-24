{ config, pkgs, inputs, ... }:

{
  networking.hostName = "framework";
  services.fwupd.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.xserver.enable = true;

  services.displayManager = {
    defaultSession = "hyprland";
    sddm = {
      enable = true;
      wayland.enable = true;
      theme = "breeze";
    };
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


}
