{ ... }:
{
  flake.nvimPlugins.tabline = { pkgs, ... }: {
    lua = builtins.readFile ./tabline.lua;
  };
}
