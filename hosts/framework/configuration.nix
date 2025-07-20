{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/common.nix
    ../../modules/framework.nix
    ../../modules/latex.nix
    ../../modules/hyprland.nix
  ];
}
