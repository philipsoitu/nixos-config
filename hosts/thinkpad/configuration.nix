{ config, pkgs, ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/thinkpad.nix
    ./hardware-configuration.nix
  ];
}
