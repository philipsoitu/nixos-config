{ inputs, config, pkgs, ... }: 

{
  home.username = "phil";
  home.homeDirectory = "/home/phil";
 
  programs.home-manager.enable = true;

  # User packages
  home.packages = with pkgs; [
    btop
    htop
    man-pages
    man-pages-posix
    neovim
  ];

  home.stateVersion = "24.11";
}
