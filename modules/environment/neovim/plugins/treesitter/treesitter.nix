{ ... }:
{
  flake.nvimPlugins.treesitter = { pkgs, ... }: {
    # Ship parsers with the wrapped Neovim instead of relying on :TSInstall,
    # whose output lives outside the immutable Nix package.
    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (grammars: with grammars; [
        bash
        c
        cpp
        css
        go
        html
        javascript
        json
        lua
        nix
        python
        svelte
        tsx
        typescript
        typst
        zig
      ]))
    ];

    runtimePkgs = with pkgs; [
      tree-sitter
    ];

    lua = builtins.readFile ./treesitter.lua;
  };
}
