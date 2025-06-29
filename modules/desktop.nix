{ config, pkgs, inputs, ... }:

{
  networking.hostName = "desktop";

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "phil" = import ../hosts/desktop/home.nix;
    };
    backupFileExtension = "backup";
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

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

}
