{ pkgs, ... }: {

  plugins = with pkgs.vimPlugins; [
    nvim-lspconfig
  ];

  runtimePkgs = with pkgs; [
    lua-language-server
    nil
    tinymist
    pyright
    zls
    clang-tools
    svelte-language-server
    vtsls
    gopls
  ];

  lua = builtins.readFile ./lspconfig.lua;
}
