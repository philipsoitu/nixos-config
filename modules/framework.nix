{ config, pkgs, inputs, ... }:

{
  networking.hostName = "framework";
  services.fwupd.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "phil" = import ../hosts/framework/home.nix;
    };
    backupFileExtension = "backup";
  };

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
    };
  };
}
