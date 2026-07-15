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
      plugins = [
        self.nvimPluginOptions
        self.nvimPluginGitsigns
      ];

      modules = map (plugin: plugin { inherit pkgs; }) plugins;

      mergedConfig = {
        plugins = lib.concatMap (module: module.plugins or [ ]) modules;
        runtimePkgs = lib.concatMap (module: module.runtimePkgs or [ ]) modules;
        lua = lib.concatStringsSep "\n" (map (module: module.lua or "") modules);
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
