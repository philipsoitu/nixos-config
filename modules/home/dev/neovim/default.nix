{
  config,
  lib,
  pkgs,
  ...
}:

{
  options.neovim.enable = lib.mkEnableOption "Enable neovim";

  config = lib.mkIf config.neovim.enable {

    programs.neovim = {
      enable = true;

      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      extraLuaConfig = ''
        ${builtins.readFile ./lua/options.lua}
        ${builtins.readFile ./lua/keymaps.lua}
        ${builtins.readFile ./lua/netrw.lua}
        ${builtins.readFile ./lua/tabline.lua}
      '';
      plugins = with pkgs.vimPlugins; [

        {
          plugin = gruvbox-nvim;
          type = "lua";
          config = ''
            require("gruvbox").setup()
            vim.cmd("colorscheme gruvbox")
          '';
        }

        {
          plugin = gitsigns-nvim;
          type = "lua";
          config = builtins.readFile ./lua/gitsigns.lua;
        }

        {
          plugin = nvim-lspconfig;
          type = "lua";
          config = builtins.readFile ./lua/lspconfig.lua;
        }

        {
          plugin = telescope-nvim;
          type = "lua";
          config = builtins.readFile ./lua/telescope.lua;
        }

        {
          plugin = nvim-treesitter.withAllGrammars;
          type = "lua";
          config = builtins.readFile ./lua/treesitter.lua;
        }

      ];

      extraPackages = with pkgs; [
        wl-clipboard

        ripgrep

        # LSPs
        lua-language-server
        nil
        tinymist
        pyright
        zls
        clang-tools
        svelte-language-server
        vtsls
      ];
    };
  };
}

# {
#   "blink.cmp": { "branch": "main", "commit": "327fff91fe6af358e990be7be1ec8b78037d2138" },
#   "bufferline.nvim": { "branch": "main", "commit": "655133c3b4c3e5e05ec549b9f8cc2894ac6f51b3" },
#   "conform.nvim": { "branch": "master", "commit": "9fd3d5e0b689ec1bf400c53cbbec72c6fdf24081" },
#   "flash.nvim": { "branch": "main", "commit": "3be9bf7e85550045ec576379a0c45aac144d0438" },
#   "friendly-snippets": { "branch": "main", "commit": "572f5660cf05f8cd8834e096d7b4c921ba18e175" },
#   "grug-far.nvim": { "branch": "main", "commit": "3e72397465f774b01aa38e4fe8e6eecf23d766d9" },
#   "lualine.nvim": { "branch": "master", "commit": "3946f0122255bc377d14a59b27b609fb3ab25768" },
#   "mini.ai": { "branch": "main", "commit": "11c57180bc9084089206e211ac7aa598bedc9673" },
#   "mini.icons": { "branch": "main", "commit": "284798619aed9f4c1ac1b9417b9a5e3b4b85ef3a" },
#   "mini.pairs": { "branch": "main", "commit": "b9aada8c0e59f2b938e98fbf4eae0799eba96ad9" },
#   "noice.nvim": { "branch": "main", "commit": "d14d02cb709e3bb2da88363c32f8b4250bced52d" },
#   "nui.nvim": { "branch": "main", "commit": "de740991c12411b663994b2860f1a4fd0937c130" },
#   "nvim-lint": { "branch": "master", "commit": "9da1fb942dd0668d5182f9c8dee801b9c190e2bb" },
#   "nvim-lspconfig": { "branch": "master", "commit": "2b52bc2190c8efde2e4de02d829a138666774c7c" },
#   "nvim-treesitter": { "branch": "main", "commit": "645f42e85d8665c91a9911c3896afb57d6b8a923" },
#   "nvim-treesitter-textobjects": { "branch": "main", "commit": "1b2d85d3de6114c4bcea89ffb2cd1ce9e3a19931" },
#   "nvim-ts-autotag": { "branch": "main", "commit": "c4ca798ab95b316a768d51eaaaee48f64a4a46bc" },
#   "persistence.nvim": { "branch": "main", "commit": "51eef57272742b773468949f6bd0503ec3f83874" },
#   "plenary.nvim": { "branch": "master", "commit": "b9fd5226c2f76c951fc8ed5923d85e4de065e509" },
#   "snacks.nvim": { "branch": "main", "commit": "e2c1c527e40aecd6d1ac011aef6d3c28a208a9ec" },
#   "todo-comments.nvim": { "branch": "main", "commit": "19d461ddd543e938eb22505fb03fa878800270b6" },
#   "tokyonight.nvim": { "branch": "main", "commit": "4fe1b0c44f5d6ee769cdfbdffc7ccb703f53feda" },
#   "trouble.nvim": { "branch": "main", "commit": "76030c5542c5d132aeeb467ca0ab370f3f79a697" },
#   "ts-comments.nvim": { "branch": "main", "commit": "217ab9cc137fceb6659b53790bd25e608219abe1" },
#   "which-key.nvim": { "branch": "main", "commit": "b4177e3eaf15fe5eb8357ebac2286d488be1ed00" }
# }
