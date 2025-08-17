{ config, lib, pkgs, ... }:

{
  options.neovim.enable = lib.mkEnableOption "Enable neovim";

  config = lib.mkIf config.neovim.enable {
    programs.neovim = {
      enable = true;

      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraPackages = with pkgs; [
	zls
        wl-clipboard
      ];

      plugins = with pkgs.vimPlugins; [
        {
	  plugin = nvim-lspconfig;
	  config = toLuaFile ./plugins/lsp.lua
	}
      ];



      extraLuaConfig = ''
        ${builtins.readFile ./options.lua }
      '';
    };
  };
}


