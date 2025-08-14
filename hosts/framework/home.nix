{ config, pkgs, ...}:

{
  imports = [
    ../../homeManagerModules
   ];

  # The User and Path it manages
  home.username = "phil";
  home.homeDirectory = "/home/phil";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # List of user programs
  home.packages = with pkgs; [
    neofetch
  ];

  git.enable;

  home.stateVersion = "24.11";
}
