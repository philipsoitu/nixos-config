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

  laptop.enable = true;
  rpi-imager.enable = true;
  school.enable = true;
  rustdesk.enable = true;
  intellij.enable = true;
}
