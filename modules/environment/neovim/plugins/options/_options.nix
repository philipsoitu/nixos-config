{ pkgs, ... }:
{
  runtimePkgs = with pkgs; [
    wl-clipboard
  ];

  lua = builtins.readFile ./options.lua;
}
