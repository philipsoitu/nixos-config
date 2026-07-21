{ self, inputs, ... }: {
  flake.nixosModules.i18n = { config, pkgs, ... }: {
    time.timeZone = "America/Toronto";
    i18n.defaultLocale = "en_CA.UTF-8";
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
