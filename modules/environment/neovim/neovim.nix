{ self, inputs, ... }:
{
  flake.nixosModules.neovim =
    { pkgs, lib, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.neovim
      ];
    };

  perSystem =
    { pkgs, lib, ... }:
    let
      initLua = ''
        ${builtins.readFile ./lua/options.lua}
        ${builtins.readFile ./lua/keymaps.lua}
        ${builtins.readFile ./lua/netrw.lua}
        ${builtins.readFile ./lua/tabline.lua}

        require("rose-pine").setup()
        vim.cmd("colorscheme rose-pine-moon")

        ${builtins.readFile ./lua/gitsigns.lua}
        ${builtins.readFile ./lua/lspconfig.lua}
        ${builtins.readFile ./lua/telescope.lua}
        ${builtins.readFile ./lua/treesitter.lua}
      '';

      plugins = with pkgs.vimPlugins; [
        rose-pine
        gitsigns-nvim
        nvim-lspconfig
        plenary-nvim
        telescope-nvim
        nvim-treesitter
      ];

      pluginTree = pkgs.linkFarm "neovim-plugins" (
        map (plugin: {
          name = "nvim/pack/plugins/start/${lib.getName plugin}";
          path = plugin;
        }) plugins
      );

      configTree = pkgs.symlinkJoin {
        name = "neovim-config";
        paths = [
          (pkgs.writeTextDir "nvim/init.lua" initLua)
          pluginTree
        ];
      };

      runtimeInputs = with pkgs; [
        self.packages.${pkgs.stdenv.hostPlatform.system}.git
        wl-clipboard
        ripgrep
        lua-language-server
        nil
        tinymist
        pyright
        zls
        clang-tools
        svelte-language-server
        vtsls
      ];

      nvimWrapped = pkgs.writeShellApplication {
        name = "nvim";
        inherit runtimeInputs;

        text = ''
          export XDG_CONFIG_HOME="${configTree}"
          exec ${pkgs.neovim}/bin/nvim "$@"
        '';
      };
    in
    {
      packages.neovim = pkgs.symlinkJoin {
        name = "neovim";
        paths = [ nvimWrapped ];

        postBuild = ''
          ln -s $out/bin/nvim $out/bin/vi
          ln -s $out/bin/nvim $out/bin/vim
          ln -s $out/bin/nvim $out/bin/vimdiff
        '';

        meta.mainProgram = "nvim";
      };
    };
}
