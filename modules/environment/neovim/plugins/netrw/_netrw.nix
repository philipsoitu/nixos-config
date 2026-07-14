{ pkgs, ... }: {
  lua = builtins.readFile ./netrw.lua;
}
