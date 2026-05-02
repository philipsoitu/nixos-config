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
  rustdesk.enable = false;

  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.graphics.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

}
