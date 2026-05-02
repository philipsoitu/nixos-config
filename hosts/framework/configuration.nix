{ self, inputs, ... }:
{

  flake.nixosModules.frameworkConfiguration =
    { config, pkgs, ... }:

    {
      imports = [
        self.nixosModules.frameworkHardware
        self.nixosModules.hyprland
        self.nixosModules.sddm
      ];

      # Bootloader.
      boot.loader.grub.enable = true;
      boot.loader.grub.efiSupport = true;
      boot.loader.grub.device = "nodev";
      boot.loader.efi.canTouchEfiVariables = true;
      boot.kernelPackages = pkgs.linuxPackages_latest;

      # Networking
      networking.hostName = "framework";
      networking.networkmanager.enable = true;

      # Time and Language
      time.timeZone = "America/Toronto";
      i18n.defaultLocale = "en_CA.UTF-8";
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };

      # User
      users.users.phil = {
        isNormalUser = true;
        description = "phil";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        packages = with pkgs; [ ];
      };

      # for build-vm
      users.users.nixosvmtest = {
        isNormalUser = true;
        initialPassword = "test";
      };

      # Settings
      system.stateVersion = "24.11";
      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

    };

}
