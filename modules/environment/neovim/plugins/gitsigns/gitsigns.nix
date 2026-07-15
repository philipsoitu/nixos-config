{ ... }:
{
  flake.nvimPluginGitsigns = { pkgs, ... }: {
    plugins = with pkgs.vimPlugins; [
      gitsigns-nvim
    ];

    lua = builtins.readFile ./gitsigns.lua;
  };
}
