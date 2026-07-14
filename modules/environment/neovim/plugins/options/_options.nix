{ pkgs, ... }:
{
  lua = builtins.readFile ./options.lua;
}
