{ self, inputs, ... }:
{
  flake.nixosModules.lazygit =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.lazygit
      ];
    };

  perSystem =
    { pkgs, self', ... }:
    let
      lazygitWrapped = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.lazygit;

        runtimeInputs = [
          self'.packages.git
        ];
      };
    in
    {
      packages.lazygit = pkgs.symlinkJoin {
        name = "lazygit";
        paths = [ lazygitWrapped ];

        postBuild = ''
          ln -s $out/bin/lazygit $out/bin/lg
        '';

        meta.mainProgram = "lazygit";
      };
    };
}
