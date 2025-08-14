{ config, pkgs, ... }:

{
  # hypr
  home.file.".config/hypr/hyprland.conf".source = ../../dotfiles/hypr/hyprland.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ../../dotfiles/hypr/hyprpaper.conf;

  # waybar
  home.file.".config/waybar/config".source = ../../dotfiles/waybar/config;
  home.file.".config/waybar/style.css".source = ../../dotfiles/waybar/style.css;

  # wofi
  home.file.".config/waybar/config".source = ../../dotfiles/waybar/config;
  home.file.".config/waybar/style.css".source = ../../dotfiles/waybar/style.css;
}
