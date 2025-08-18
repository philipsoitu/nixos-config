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
}
