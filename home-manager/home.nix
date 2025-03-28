{ config, pkgs, lib, ... }:

{
  home = {
    username = "phil";
    homeDirectory = "/home/phil";
    stateVersion = "24.11";
  };

  # Home Manager user configurations
  programs.zsh.enable = true;
# programs.zsh.promptInit = ''
#   PROMPT='%F{green}%n@%m%f %F{blue}%~%f %# '
# '';

  # Neovim configuration
  programs.neovim = {
    enable = true;
    viAlias = true;
  };

  # Firefox configuration
  programs.firefox = {
    enable = true;
  };

# # i3 configuration
# programs.i3 = {
#   enable = true;
# };

# # Polybar configuration
# programs.polybar = {
#   enable = true;
# };

# # Picom configuration
# programs.picom = {
#   enable = true;
# };

  # Ghostty configuration
  programs.ghostty = {
    enable = true;
  };

  # Rofi configuration
  programs.rofi = {
    enable = true;
  };
}

