{ self, inputs, ... }: {
  flake.nixosModules.tailscale = { config, pkgs, ... }: {
    services.tailscale.enable = true;
  };
}
