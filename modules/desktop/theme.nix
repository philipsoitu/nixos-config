let
  theme = rose-pine;

  rose-pine = {
    ghostty = "Rose Pine Moon";
    waybarConfig = ./waybar/rose-pine/config.jsonc;
    waybarStyle = ./waybar/rose-pine/style.css;
  };

  gruvbox = {
    ghostty = "Gruvbox Dark";
    waybarConfig = ./waybar/gruvbox/config.jsonc;
    waybarStyle = ./waybar/gruvbox/style.css;
  };

  stripHash =
    str:
    if builtins.substring 0 1 str == "#" then
      builtins.substring 1 (builtins.stringLength str - 1) str
    else
      str;

  themeNoHash = builtins.mapAttrs (_: v: stripHash v) theme;
in
{
  flake = {
    inherit theme themeNoHash;
  };
}
