{ self, inputs, ... }:
{
  flake.nixosModules.git =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.git
      ];
    };

  perSystem =
    { pkgs, ... }:
    {
      packages.git = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.git;

        env = rec {
          GIT_AUTHOR_NAME = "philipsoitu";
          GIT_AUTHOR_EMAIL = "philip.soitu@gmail.com";
          GIT_COMMITTER_NAME = GIT_AUTHOR_NAME;
          GIT_COMMITTER_EMAIL = GIT_AUTHOR_EMAIL;
        };

        args = [
          "-c"
          "init.defaultBranch=main"
          "-c"
          "core.editor=nvim"
        ];

        runtimeInputs = [
          pkgs.neovim
        ];
      };
    };
}
