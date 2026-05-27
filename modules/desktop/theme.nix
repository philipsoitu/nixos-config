let
  theme = rose-pine-theme;

  rose-pine-theme = {
    ghostty = "Rose Pine Moon";
  };

  gruvbox-theme = {
    ghostty = "Gruvbox Dark";
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
