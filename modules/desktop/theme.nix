let
  rose-pine-theme = {
    base00 = "#232136";
    base01 = "#2a273f";
    base02 = "#393552";
    base03 = "#6e6a86";
    base04 = "#908caa";
    base05 = "#e0def4";
    base06 = "#eb6f92";
    base07 = "#f6c177";
    base08 = "#ea9a97";
    base09 = "#3e8fb0";
    base0A = "#9ccfd8";
    base0B = "#c4a7e7";
    base0C = "#95b1ac";
    base0D = "#2a283e";
    base0E = "#44415a";
    base0F = "#56526e";
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
