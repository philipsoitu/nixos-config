{ config, pkgs, inputs, ... }:

{
  networking.hostName = "framework";
  services.fwupd.enable = true;
}
