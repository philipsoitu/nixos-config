{ config, pkgs, lib, ... }:

let
  nvimConfigSrc = pkgs.lib.cleanSource .dotfiles/nvim;
in
{
  options.neovim.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "enable neovim custom config";
  };

  config = lib.mkIf config.neovim.enable {

    environment.systemPackages = with pkgs; [
      neovim
      git
      ripgrep
      fd
    ];

    # Create a symlink ~/.config/nvim -> the nix store path of your config
    systemd.tmpfiles.rules = [
      "L+ /home/${config.users.users.yourUsername.name}/.config/nvim - - - - ${nvimConfigSrc}"
    ];
  };
}
