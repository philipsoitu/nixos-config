{
  lib,
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.environment =
    { ... }:
    {
      imports = [
        self.nixosModules.git
        self.nixosModules.neovim
        self.nixosModules.tmux
        self.nixosModules.tmux-sessionizer
      ];
    };

  perSystem =
    { pkgs, self', ... }:
    {
      packages.environment = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;

        package = pkgs.bash;

        runtimeInputs = [
          self'.packages.git
          self'.packages.neovim
          self'.packages.tmux
          self'.packages.tmux-sessionizer
        ];

        env = {
          EDITOR = lib.getExe self'.packages.neovim;
        };

      };
    };
}
