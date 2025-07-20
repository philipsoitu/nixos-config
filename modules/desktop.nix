{ config, pkgs, inputs, ... }:

{
  networking.hostName = "desktop";

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "phil" = import ../hosts/desktop/home.nix;
    };
    backupFileExtension = "backup";
  };
}
