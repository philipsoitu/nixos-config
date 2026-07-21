{ self, inputs, ... }: {
  flake.nixosModules.settings = { config, pkgs, ... }: {

    system.stateVersion = "26.05";

    nixpkgs.config.allowUnfree = true;

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

  };
}
