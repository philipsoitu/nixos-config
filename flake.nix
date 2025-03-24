{
  description = "My NixOS configuration with Home Manager";

  inputs = {
    nixos.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
  };

  outputs = { self, nixos, home-manager, ... }: {
    nixosConfigurations = {

      nixos-desktop = nixos.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos-config/configuration.nix

          # Home Manager configuration module
          home-manager.nixosModules.home-manager
        ];
        specialArgs = { inherit home-manager; };
      };

    };

    # Home Manager configuration (this part will be linked to your user)
    homeConfigurations = {
      phil = home-manager.lib.homeManagerConfiguration {
        pkgs = nixos.pkgs;
        modules = [ ./home-manager/default.nix ];
      };
    };
  };
}

