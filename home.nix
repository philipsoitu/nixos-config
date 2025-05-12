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
    ".config/waybar/styles.css".source = ./dotfiles/waybar/styles.css;

    # rofi
    ".config/rofi/config.rasi".source = ./dotfiles/rofi/config.rasi;
    ".config/rofi/catppuccin-mocha.rasi".source = ./dotfiles/rofi/catppuccin-mocha.rasi;

    # wallpapers
    ".config/wallpapers/lake.jpg".source = ./dotfiles/wallpapers/lake.jpg;

    # ghostty
    ".config/ghostty/config".source = ./dotfiles/ghostty/config;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


}
