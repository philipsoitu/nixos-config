{ config, pkgs, ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/framework.nix
    ./hardware-configuration.nix
    ../../modules/latex.nix
  ];
}
