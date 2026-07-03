{ self, inputs, ... }:
{

  flake.nixosModules.desktopConfiguration =

    { config, pkgs, ... }:

    let
      llamaCppPkgs = import inputs.nixpkgs-llama-cpp {
        system = pkgs.stdenv.hostPlatform.system;
        config.allowUnfree = true;
      };

      llamaCppLatest = llamaCppPkgs.llama-cpp-vulkan.overrideAttrs (old: {
        version = "9717";

        src = llamaCppPkgs.fetchFromGitHub {
          owner = "ggml-org";
          repo = "llama.cpp";
          tag = "b9717";
          hash = "sha256-or3WQBRjK/ZsIhdTGxLPKck7452KvNdahAJrB4+wFgg=";
          leaveDotGit = true;
          postFetch = ''
            git -C "$out" rev-parse --short HEAD > $out/COMMIT
            find "$out" -name .git -print0 | xargs -0 rm -rf
          '';
        };
        npmDepsHash = "sha256-0dctM/apI3ysMIEVBaBXO9hZMWskpJpNpOws1gwiOYc=";
      });
    in
    {
      imports = [
        self.nixosModules.desktopHardware
        self.nixosModules.environment
        self.nixosModules.desktop
        self.nixosModules.apps
      ];

      # Bootloader.
      boot.loader.grub.enable = true;
      boot.loader.grub.efiSupport = true;
      boot.loader.grub.device = "nodev";
      boot.loader.efi.canTouchEfiVariables = true;
      boot.kernelPackages = pkgs.linuxPackages_latest;

      boot.kernelParams = [ "pcie_aspm=off" ]; # shoutout my trash mobo

      # Enable networking
      networking.hostName = "desktop";
      networking.networkmanager.enable = true;

      # Time and Language
      time.timeZone = "America/Toronto";
      i18n.defaultLocale = "en_CA.UTF-8";
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };

      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users."phil" = {
        isNormalUser = true;
        description = "phil";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        packages = with pkgs; [ ];
      };

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      services.tailscale.enable = true;

      services.openssh.enable = true;

      boot.initrd.kernelModules = [ "amdgpu" ];
      hardware.graphics.enable = true;

      system.stateVersion = "26.05";
    };
}
