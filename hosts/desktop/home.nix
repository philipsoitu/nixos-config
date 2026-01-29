{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home
  ];

  # The User and Path it manages
  home.username = "phil";
  home.homeDirectory = "/home/phil";
  home.stateVersion = "24.11";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # apps
  ghostty.enable = true;
  firefox.enable = true;

  # terminal apps
  git.enable = true;
  neovim.enable = true;
  bash.enable = true;
  tmux.enable = true;
  tmux-sessionizer.enable = true;

}
