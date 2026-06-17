{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-ollama.url = "github:NixOS/nixpkgs/a799d3e3886da994fa307f817a6bc705ae538eeb";
    nixpkgs-orca-slicer.url = "github:NixOS/nixpkgs/62efab0dada7d38f14f7147bdd6c350780e9af10";

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
