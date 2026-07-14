{ pkgs, ... }: {
  lua = builtins.readFile ./tabline.lua;
}
