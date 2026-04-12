{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home
  ];

  # The User and Path it manages
  home.username = "phil";
  home.homeDirectory = "/home/phil";
  home.stateVersion = "26.05";

  # terminal apps
  git.enable = true;
  neovim.enable = true;
  bash.enable = true;
  tmux.enable = true;
  tmux-sessionizer.enable = true;

  home.packages = [
    pkgs.typst
  ];
}
