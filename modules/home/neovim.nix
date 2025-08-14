{ config, lib, pkgs, ... }:

{
  options.neovim.enable = lib.mkEnableOption "Enable neovim";

  config = lib.mkIf config.neovim.enable {
    programs.neovim = {
      enable = true;

      plugins = with pkgs.vimPlugins; [
        vim-nix
        nerdtree
        vim-airline
      ];

      extraConfig = ''
        set number
        syntax on
        set expandtab
        set shiftwidth=2
        set tabstop=2
      '';
    };
  };
}
