{ config, pkgs, lib, ... }:

{
  imports = [
    # Include Home Manager module
    home-manager.nixosModules.home-manager
  ];

  # General system configurations
  system.stateVersion = "24.11";

  # Enable the X11 server
  services.xserver.enable = true;
  
  
  # Enable i3 window manager
  services.xserver.windowManager.i3.enable = true;

  # Enable Rofi as the application launcher and
  # Enable Picom as the compositor
  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.rofi}/bin/rofi -show drun &
    ${pkgs.picom}/bin/picom &
  '';

  environment.systemPackages = with pkgs; [
    polybar
    ghostty
    neovim
    firefox
  ];

  # Home Manager settings
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}

