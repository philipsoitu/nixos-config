{ config, pkgs, lib, ... }:

{
  home = {
    username = "phil";
    homeDirectory = "/home/phil";
  };

  # Home Manager user configurations
  programs.zsh.enable = true;
  programs.zsh.promptInit = ''
    PROMPT='%F{green}%n@%m%f %F{blue}%~%f %# '
  '';

  # Neovim configuration
  programs.neovim = {
    enable = true;
    viAlias = true;
  };

  # Firefox configuration
  programs.firefox = {
    enable = true;
    defaultProfile = {
      name = "default";
      homepage = "https://www.mozilla.org";
    };
  };

  # i3 configuration
  programs.i3 = {
    enable = true;
    extraConfig = ''
      # i3 configuration settings
    '';
  };

  # Polybar configuration
  programs.polybar = {
    enable = true;
    extraConfig = ''
      # Polybar configuration settings
    '';
  };

  # Picom configuration
  programs.picom = {
    enable = true;
    extraConfig = ''
      # Picom configuration settings
    '';
  };

  # Ghostty configuration
  programs.ghostty = {
    enable = true;
    extraConfig = ''
      # Ghostty configuration settings
    '';
  };

  # Rofi configuration
  programs.rofi = {
    enable = true;
    extraConfig = ''
      # Rofi configuration settings
    '';
  };
}

