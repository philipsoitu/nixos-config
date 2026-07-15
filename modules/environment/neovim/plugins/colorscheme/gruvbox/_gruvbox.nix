{ pkgs, ... }: {
  plugins = with pkgs.vimPlugins; [
    gruvbox-nvim
  ];

  lua = builtins.readFile ./gruvbox.lua;
}
