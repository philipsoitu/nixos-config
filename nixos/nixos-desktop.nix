{ config, pkgs, lib, ... }:

{
  imports = [
    ../hardware-configuration.nix
    ./common.nix
  ];

  networking.hostName = "nixos-desktop";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";
  
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
}

