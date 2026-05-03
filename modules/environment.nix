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
        self.nixosModules.bash
        self.nixosModules.git
        self.nixosModules.neovim
        self.nixosModules.tmux
        self.nixosModules.tmux-sessionizer
        self.nixosModules.unfuck-bluetooth
      ];
    };

  perSystem =
    { pkgs, self', ... }:
    {
      packages.environment = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;

        package = self'.packages.bash;

        runtimeInputs = [

          pkgs.codex

          self'.packages.neovim
          self'.packages.tmux
          self'.packages.tmux-sessionizer
          self'.packages.unfuck-bluetooth
          self'.packages.git
        ];

        env = {
          EDITOR = lib.getExe self'.packages.neovim;
          SHELL = lib.getExe self'.packages.bash;
        };

      };
    };
}
