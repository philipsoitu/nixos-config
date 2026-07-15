{ ... }:
{
  flake.nvimPlugins.rose-pine = { pkgs, ... }: {
    plugins = with pkgs.vimPlugins; [
      rose-pine
    ];

    lua = builtins.readFile ./rose-pine.lua;
  };
}
