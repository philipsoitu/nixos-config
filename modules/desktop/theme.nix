let
  rose-pine-theme = {
    base00 = "#232136"; # bg
    base01 = "#2a273f"; # dark
    base02 = "#393552";
    base03 = "#6e6a86";
    base04 = "#908caa";
    base05 = "#e0def4";
    base06 = "#9ccfd8"; # fg
    base07 = "#c4a7e7"; # light fg
    base08 = "#eb6f92"; # red
    base09 = "#ea9a97"; # orange
    base0A = "#f6c177"; # yellow
    base0B = "#3e8fb0"; # green
    base0C = "#9ccfd8"; # cyan
    base0D = "#c4a7e7"; # blue
    base0E = "#c4a7e7"; # magenta
    base0F = "#56526e"; # orange
  };

  stripHash =
    str:
    if builtins.substring 0 1 str == "#" then
      builtins.substring 1 (builtins.stringLength str - 1) str
    else
      str;

  theme = rose-pine-theme;
  themeNoHash = builtins.mapAttrs (_: v: stripHash v) theme;
in
{
  flake = {
    inherit theme themeNoHash;
  };
}
