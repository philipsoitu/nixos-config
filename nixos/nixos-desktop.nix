{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common.nix
  ];

  networking.hostName = "nixos-desktop";

  # Hostname-specific configurations
  # Example: Set the system timezone
  time.timeZone = "America/Toronto";
}

