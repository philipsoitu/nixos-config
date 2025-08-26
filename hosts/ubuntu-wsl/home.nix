{ config, pkgs, ...}:

{
  imports = [
    ../../modules/home
   ];

  # The User and Path it manages
  home.username = "phil";
  home.homeDirectory = "/home/phil";
  home.stateVersion = "24.11";
  home.backupFileExtension = "backup";

  # terminal apps
  git.enable = true;
  neovim.enable = true;
  bash.enable = true;
}
