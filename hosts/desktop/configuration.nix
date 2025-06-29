{ config, pkgs, ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/desktop.nix
    ./hardware-configuration.nix
  ];
}
