{ config, lib, pkgs, ... }:

{
  options.neovim.enable = lib.mkEnableOption "Enable neovim";

  config = lib.mkIf config.neovim.enable {
    programs.neovim = {
      enable = true;

      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      plugins = with pkgs.vimPlugins; [
        nvim-treesitter
        nvim-lspconfig
        nvim-cmp
        luasnip
        which-key-nvim
        nvim-tree
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

        -- Open nvim-tree
        map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

        -- Optional: basic Telescope mapping
        map("n", "<leader>f", ":Telescope find_files<CR>", opts)

        -- Treesitter
        require("nvim-treesitter.configs").setup {
          ensure_installed = "all",
          highlight = { enable = true },
        }

        -- nvim-tree setup
        require("nvim-tree").setup {
          auto_close = true,
          hijack_cursor = true,
          view = { width = 30, side = "left" },
        }

        -- which-key setup
        require("which-key").setup {}
      '';
    };
  };
}


