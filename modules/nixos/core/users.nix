{ config, pkgs, ... }:

{
  users.users.phil = {
    isNormalUser = true;
    description = "phil";
    extraGroups = [ "networkmanager" "wheel" "disk" ];
    packages = with pkgs; [];
  };
}
