{ config, pkgs, ...}:

{
  imports = [
    ../../modules/home
   ];

  # The User and Path it manages
  home.username = "phil";
  home.homeDirectory = "/home/phil";
  home.stateVersion = "24.11";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # desktop config
  hyprland.enable = true;
  hyprpaper.enable = true;
  waybar.enable = true;
  wofi.enable = true;
  dunst.enable = true;

  # apps
  ghostty.enable = true;

  # terminal apps
  git.enable = true;
  neovim.enable = true;
}
