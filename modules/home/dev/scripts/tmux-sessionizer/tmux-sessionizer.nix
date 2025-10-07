{ config, pkgs, lib, ... }:

let
  tmux-sessionizer = pkgs.writeShellScriptBin "tmux-sessionizer" ''
    #!/usr/bin/env bash
    set -euo pipefail

    # Add dependencies just for this script
    PATH=${ lib.makeBinPath [
        pkgs.fzf
        pkgs.tmux
        pkgs.findutils
        pkgs.coreutils
      ] }:$PATH

    # Insert the contents of your actual bash script
    ${builtins.readFile ./tmux-sessionizer.sh}
  '';
in {
  options.tmux-sessionizer.enable = lib.mkEnableOption "Enable tmux-sessionizer";

  config = lib.mkIf config.tmux-sessionizer.enable {
    home.packages = [
      tmux-sessionizer
    ];
  };
}
