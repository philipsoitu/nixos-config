{ lib, ... }:
{
  perSystem =
    { pkgs, ... }:
    {
      packages = lib.optionalAttrs (pkgs.stdenv.hostPlatform.system == "x86_64-linux") {
        bun-old-cpu = pkgs.bun.overrideAttrs (oldAttrs: {
          src = pkgs.fetchurl {
            url = "https://github.com/oven-sh/bun/releases/download/bun-v${oldAttrs.version}/bun-linux-x64-baseline.zip";
            hash = "sha256-q+NG9jQUVHzfazW3pkmkkMcouT0AYiYVaSORioTA5Zs=";
          };

          sourceRoot = "bun-linux-x64-baseline";

          meta = oldAttrs.meta // {
            description = "${oldAttrs.meta.description} (x64 baseline build for older CPUs)";
          };
        });
      };
    };
}
