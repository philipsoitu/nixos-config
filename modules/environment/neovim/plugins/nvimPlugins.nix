{ lib, ... }:
{
  options.flake.nvimPlugins = lib.mkOption {
    type = lib.types.lazyAttrsOf lib.types.raw;
    default = { };
  };
}
