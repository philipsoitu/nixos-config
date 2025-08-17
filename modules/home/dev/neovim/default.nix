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
        wl-clipboard
      ];
    };
    home.file.".config/nvim/init.lua".source = ./init.lua;
    home.file.".config/nvim/lua/config/autocmds.lua".source = ./lua/config/autocmds.lua;
    home.file.".config/nvim/lua/config/keymaps.lua".source = ./lua/config/keymaps.lua;
    home.file.".config/nvim/lua/config/lazy.lua".source = ./lua/config/lazy.lua;
    home.file.".config/nvim/lua/config/options.lua".source = ./lua/config/options.lua;
    home.file.".config/nvim/lua/plugins/example.lua".source = ./lua/plugins/example.lua;
    home.file.".config/nvim/lua/plugins/colorscheme.lua".source = ./lua/plugins/colorscheme.lua;
    home.file.".config/nvim/stylua.toml".source = ./stylua.toml;



  };
}


