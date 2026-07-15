{ ... }: {
  flake.nvimPlugins.netrw = { pkgs, ... }: {
    lua = builtins.readFile ./netrw.lua;
  };
}
