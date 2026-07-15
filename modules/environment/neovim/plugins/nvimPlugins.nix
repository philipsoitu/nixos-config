{ lib, ... }:
{
  # Like flake.nixosModules, declare the namespace so separate modules can
  # contribute named entries without exposing intermediate flake outputs.
  options.flake.nvimPlugins = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.raw;
    default = { };
    description = "Neovim plugin configurations keyed by plugin name.";
  };
}
