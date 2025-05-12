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

    # neovim
    ".config/nvim/init.lua".source = ./dotfiles/nvim/init.lua;
    ".config/nvim/lua/config/autocmds.lua".source = ./dotfiles/nvim/lua/config/autocmds.lua;
    ".config/nvim/lua/config/keymaps.lua".source = ./dotfiles/nvim/lua/config/keymaps.lua;
    ".config/nvim/lua/config/lazy.lua".source = ./dotfiles/nvim/lua/config/lazy.lua;
    ".config/nvim/lua/config/options.lua".source = ./dotfiles/nvim/lua/config/options.lua;
    ".config/nvim/lua/plugins/example.lua".source = ./dotfiles/nvim/lua/plugins/example.lua;
    ".config/nvim/stylua.toml".source = ./dotfiles/nvim/stylua.toml;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


}
