{ ... }:
{
  flake.nvimPlugins.telescope = { pkgs, ... }: {
    plugins = with pkgs.vimPlugins; [
      telescope-nvim
    ];

    runtimePkgs = with pkgs; [
      ripgrep
      fd
    ];

    lua = builtins.readFile ./telescope.lua;
  };
}
