{ ... }:
{
  flake.nvimPlugins.treesitter = { pkgs, ... }: {
    plugins = with pkgs.vimPlugins; [
      nvim-treesitter
    ];

    runtimePkgs = with pkgs; [
      tree-sitter
    ];

    lua = builtins.readFile ./treesitter.lua;
  };
}
