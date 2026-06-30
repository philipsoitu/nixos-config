let
  theme = rose-pine;

  rose-pine = {
    ghostty = "Rose Pine Moon";
    waybarConfig = ./desktop/waybar/rose-pine/config.jsonc;
    waybarStyle = ./desktop/waybar/rose-pine/style.css;
  };

  gruvbox = {
    ghostty = "Gruvbox Dark";
    waybarConfig = ./desktop/waybar/gruvbox/config.jsonc;
    waybarStyle = ./desktop/waybar/gruvbox/style.css;
  };

in
{
  flake = {
    inherit theme;
  };
}
