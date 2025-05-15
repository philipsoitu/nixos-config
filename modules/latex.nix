{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    texliveFull
    zathura
  ];

}
