{ ... }:
{
  flake.nvimPlugins.options = { pkgs, ... }: {
    runtimePkgs = pkgs.lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      pkgs.wl-clipboard
    ];

    lua = builtins.readFile ./options.lua;
  };
}
