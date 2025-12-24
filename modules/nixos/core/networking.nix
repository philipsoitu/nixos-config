{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.hostName = "framework";
}
