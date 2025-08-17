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

      plugins = with pkgs.vimPlugins; [
        nvim-treesitter
        telescope-nvim
      ];

      extraConfig = ''
        set number
        set relativenumber
        set nowrap
        set noswapfile
      '';

      extraLuaConfig = ''
        -- Set leader key
        vim.g.mapleader = " "

        -- Keymaps
        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }

        -- Optional: basic Telescope mapping
        map("n", "<leader>f", ":Telescope find_files<CR>", opts)

        -- Treesitter
        require("nvim-treesitter.configs").setup {
          ensure_installed = "all",
          highlight = { enable = true },
        }
      '';
    };
  };
}


