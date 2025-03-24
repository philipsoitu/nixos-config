{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vim
    git
    neovim
  ];


  home.file.".bashrc".text = ''
    # TODO: add my bashrc configs from my laptop
  '';
}

