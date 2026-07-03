let
  theme = rose-pine;

  rose-pine = {
    ghostty = "Rose Pine Moon";
    waybarConfig = ./modules/desktop/waybar/rose-pine/config.jsonc;
    waybarStyle = ./modules/desktop/waybar/rose-pine/style.css;
  };

  gruvbox = {
    ghostty = "Gruvbox Dark";
    waybarConfig = ./modules/desktop/waybar/gruvbox/config.jsonc;
    waybarStyle = ./modules/desktop/waybar/gruvbox/style.css;
  };

in
{
  flake = {
    inherit theme;
  };
}
