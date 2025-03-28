{
  description = "in my neckbeard era";
  
  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/framework/configuration.nix
        ./nixosModules
      ];
    }
  }
}
