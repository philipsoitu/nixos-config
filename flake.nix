{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-orca-slicer.url = "github:NixOS/nixpkgs/62efab0dada7d38f14f7147bdd6c350780e9af10";
    nixpkgs-llama-cpp.url = "github:NixOS/nixpkgs/dea49413a4cf3be31dc2afb836a90eeee4a5d3c2";

    flake-parts.url = "github:hercules-ci/flake-parts";

    wrappers.url = "github:Lassulus/wrappers";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  outputs =
    inputs:
    let
      inherit (inputs.nixpkgs) lib;

      importAll =
        path:
        lib.fileset.toList (
          inputs.nixpkgs.lib.fileset.fileFilter (
            file: file.hasExt "nix" && file.name != "flake.nix" && !lib.hasPrefix "_" file.name
          ) path
        );
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = importAll ./.;
    };

}
