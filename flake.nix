{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    wrappers.url = "github:Lassulus/wrappers";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  outputs =
    inputs:
    let
      modules = inputs.import-tree ./modules;
      hosts = inputs.import-tree ./hosts;
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = modules.imports ++ hosts.imports;
    };

}
