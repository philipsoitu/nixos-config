{ self, inputs, ... }:
{

  flake.nixosModules.frameworkConfiguration =
    { config, pkgs, ... }:

    {
      imports = [
        self.nixosModules.frameworkHardware
        # self.nixosModules.desktop
        self.nixosModules.dms-hyprland
        self.nixosModules.apps
        self.nixosModules.environment
        self.nixosModules.core
      ];

      # Networking
      networking.hostName = "framework";
      networking.networkmanager.enable = true;

      # Printer
      services.printing.enable = true;
      services.printing.drivers = [ pkgs.brlaser ];

      # Packages
      environment.systemPackages = [
        pkgs.brightnessctl
      ];

      boot.initrd.kernelModules = [ "amdgpu" ];
      hardware.graphics.enable = true;

      hardware.bluetooth.enable = true;
      services.blueman.enable = true;

    };

}
