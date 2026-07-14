{ pkgs, ... }:
{
  lua = builtins.readFile ./keymaps.lua;
}
