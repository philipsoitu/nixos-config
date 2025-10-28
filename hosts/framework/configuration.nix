{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/nixos
    ];

  hyprland.enable = true;
  pipewire.enable = true;
  sddm.enable = true;
  hyprshot.enable = true;

  minecraft.enable = true;
  printer.enable = true;

  laptop.enable = true;
  rpi-imager.enable = false;
  school.enable = true;
  rustdesk.enable = true;
}
