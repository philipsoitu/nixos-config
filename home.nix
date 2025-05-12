{ config, pkgs, ... }:

{
  home.username = "phil";
  home.homeDirectory = "/home/phil";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    hello
  ];

  home.file = {

    # hypr
    ".config/hypr/hyprland.conf".source = ./dotfiles/hypr/hyprland.conf;
    ".config/hypr/hyprpaper.conf".source = ./dotfiles/hypr/hyprpaper.conf;
    
    # waybar
    ".config/waybar/config".source = ./dotfiles/waybar/config;
    ".config/waybar/style.css".source = ./dotfiles/waybar/style.css;

    # wofi 
    ".config/wofi/config".source = ./dotfiles/wofi/config;
    ".config/wofi/style.css".source = ./dotfiles/wofi/style.css;

    # wallpapers
    ".config/wallpapers/lake.jpg".source = ./dotfiles/wallpapers/lake.jpg;

    # dunst
    ".config/dunst/dunstrc".source = ./dotfiles/dunst/dunstrc;

    # ghostty
    ".config/ghostty/config".source = ./dotfiles/ghostty/config;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


}
