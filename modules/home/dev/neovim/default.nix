{ config, lib, pkgs, ... }:

{
  options.neovim.enable = lib.mkEnableOption "Enable neovim";

  config = lib.mkIf config.neovim.enable {
    programs.neovim =
    let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
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
	  config = toLuaFile ./plugins/lsp.lua;
	}
      ];



      extraLuaConfig = ''
        ${builtins.readFile ./options.lua }
      '';
    };
  };
}


