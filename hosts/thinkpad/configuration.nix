{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/thinkpad.nix
    ../../modules/window-managers/kde.nix
  ];
}
