{ config, pkgs, inputs, ... }:

{

  networking.hostName = "thinkpad"; 

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "phil" = import ../hosts/thinkpad/home.nix;
    };
    backupFileExtension = "backup";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    libreoffice-qt6-fresh
    hunspell
    hunspellDicts.en_CA
  ];
}
