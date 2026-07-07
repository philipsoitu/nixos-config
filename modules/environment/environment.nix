{
  lib,
  self,
  inputs,
  ...
}:
{
  flake.nixosModules.environment =
    { pkgs, ... }:
    {
      imports = [
        self.nixosModules.bash
        self.nixosModules.git
        self.nixosModules.lazygit
        self.nixosModules.pi
        self.nixosModules.neovim
        self.nixosModules.tmux
        self.nixosModules.tmux-sessionizer
      ];

      environment.systemPackages = with pkgs; [
        codex
        typst
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
          pkgs.typst

          self'.packages.neovim
          self'.packages.tmux
          self'.packages.tmux-sessionizer
          self'.packages.git
          self'.packages.lazygit
          self'.packages.pi
        ];

        env = {
          EDITOR = lib.getExe self'.packages.neovim;
          SHELL = lib.getExe self'.packages.bash;
        };

      };
    };
}
