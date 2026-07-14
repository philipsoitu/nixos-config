{ self, inputs, ... }: {
  flake.nixosModules.neovim = { pkgs, lib, ... }: {
    environment.variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.neovim
    ];
  };

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    let
      getPlugins = pkgs: [
        (import ./plugins/colorscheme/_colorscheme.nix { inherit pkgs; })
        (import ./plugins/options/_options.nix { inherit pkgs; })
        (import ./plugins/gitsigns/_gitsigns.nix { inherit pkgs; })
        (import ./plugins/keymaps/_keymaps.nix { inherit pkgs; })
        (import ./plugins/netrw/_netrw.nix { inherit pkgs; })
        (import ./plugins/lspconfig/_lspconfig.nix { inherit pkgs; })
        (import ./plugins/tabline/_tabline.nix { inherit pkgs; })
        (import ./plugins/telescope/_telescope.nix { inherit pkgs; })
        (import ./plugins/treesitter/_treesitter.nix { inherit pkgs; })
      ];

      modules = getPlugins pkgs;

      mergedConfig = {
        plugins = lib.concatMap (m: m.plugins or [ ]) modules;
        runtimePkgs = lib.concatMap (m: m.runtimePkgs or [ ]) modules;
        lua = lib.concatStringsSep "\n" (map (m: m.lua or "") modules);
      };

    in
    {
      packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap {
        inherit pkgs;
        specs.allPlugins = mergedConfig.plugins;
        runtimePkgs = mergedConfig.runtimePkgs;
        settings.config_directory = pkgs.writeTextDir "init.lua" mergedConfig.lua;
      };
    };
}
