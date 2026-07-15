let
  theme = gruvbox;

  rose-pine = {
    ghostty = "Rose Pine Moon";
    waybar = {
      config = ./modules/desktop/waybar/rose-pine/config.jsonc;
      style = ./modules/desktop/waybar/rose-pine/style.css;
    };
    nvimTheme = ./modules/environment/neovim/plugins/colorscheme/rose-pine/_rose-pine.nix;
    wallpaper = ./wallpapers/rose-pine/forest-5.jpg;
  };

  gruvbox = {
    ghostty = "Gruvbox Dark";
    waybar = {
      config = ./modules/desktop/waybar/gruvbox/config.jsonc;
      style = ./modules/desktop/waybar/gruvbox/style.css;
    };
    nvimTheme = ./modules/environment/neovim/plugins/colorscheme/gruvbox/_gruvbox.nix;
    wallpaper = ./wallpapers/gruvbox/lake.jpg;
  };

in
{
  flake = {
    inherit theme;
  };
}
