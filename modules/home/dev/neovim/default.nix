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

      initLua = ''
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

        { plugin = plenary-nvim; }
        {
          plugin = telescope-nvim;
          type = "lua";
          config = builtins.readFile ./lua/telescope.lua;
        }

        {
          plugin = nvim-treesitter;
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
