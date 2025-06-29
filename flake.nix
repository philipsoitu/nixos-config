{
  description = "nixos btw";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {

      framework = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/framework/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      thinkpad = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/thinkpad/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/desktop/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };


    };
  };
}
