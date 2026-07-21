{ self, inputs, ... }:
{

  flake.nixosModules.desktopConfiguration =

    { config, pkgs, ... }:

    {
      imports = [
        self.nixosModules.desktopHardware
        self.nixosModules.environment
        self.nixosModules.desktop
        self.nixosModules.apps
        self.nixosModules.core
      ];

      # shoutout my trash mobo
      boot.kernelParams = [ "pcie_aspm=off" ];
      boot.extraModprobeConfig = ''
        options rtl8821ae fwlps=0 ips=0 swlps=0 msi=1 aspm=0 ant_sel=2
      '';

      networking.hostName = "desktop";
      networking.networkmanager.enable = true;

      services.openssh.enable = true;

      boot.initrd.kernelModules = [ "amdgpu" ];
      hardware.graphics.enable = true;

    };
}
