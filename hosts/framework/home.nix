{ config, pkgs, ...}:

{
  imports = [
#    ./git # looks for ./git/defualt.nix
#   ./hypr/hyprland.nix # looks for ./hypr/hyprland.nix
   ];
    
  # The User and Path it manages
  home.username = "phil";
  home.homeDirectory = "/home/phil";
  home.stateVersion = "24.11";
  
  # Let Home Manager manage itself
  programs.home-manager.enable = true;
  
  # List of user programs
  home.packages = with pkgs; [
    neofetch
  ];
  
}
