{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  hyprland.enable = true;
  hyprpaper.enable = true;
  pipewire.enable = true;
  sddm.enable = true;
  hyprshot.enable = true;

  minecraft.enable = true;
  printer.enable = true;

  laptop.enable = true;
  school.enable = true;
  rustdesk.enable = true;

  intellij.enable = true;

  environment.systemPackages = [
    pkgs.code-cursor
    pkgs.obs-studio
  ];
}
