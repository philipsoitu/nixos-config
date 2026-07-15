let
  theme = rose-pine;

  rose-pine = {
    ghostty = "Rose Pine Moon";
    waybarConfig = ./modules/desktop/waybar/rose-pine/config.jsonc;
    waybarStyle = ./modules/desktop/waybar/rose-pine/style.css;
    nvimTheme = ./modules/environment/neovim/plugins/colorscheme/rose-pine/_rose-pine.nix;
  };

  gruvbox = {
    ghostty = "Gruvbox Dark";
    waybarConfig = ./modules/desktop/waybar/gruvbox/config.jsonc;
    waybarStyle = ./modules/desktop/waybar/gruvbox/style.css;
    nvimTheme = ./modules/environment/neovim/plugins/colorscheme/gruvbox/_gruvbox.nix;
  };

in
{
  flake = {
    inherit theme;
  };
}
