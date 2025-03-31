{
  description = "NixOS Configuration with Home Manager for phil";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      nixos-desktop = lib.nixosSystem {
        system = system;
        specialArgs = { inherit home-manager; };
        modules = [
          ./nixos/common.nix
          ./nixos/nixos-desktop.nix
	  home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.phil = import ./home-manager/home.nix;
          }
        ];
      };
    };


    homeConfigurations = {
      "phil@nixos-desktop" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
  };
}

