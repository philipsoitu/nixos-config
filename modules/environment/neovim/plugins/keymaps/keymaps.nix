{ ... }: {
  flake.nvimPlugins.keymaps =
    { pkgs, ... }:
    {
      lua = builtins.readFile ./keymaps.lua;
    };
}
