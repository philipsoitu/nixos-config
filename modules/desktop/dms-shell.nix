{ self, inputs, ... }:
{
  flake.nixosModules.dms-shell =
    { pkgs, ... }:
    {
      services.upower.enable = true;
      # Backend for DMS's power-profile controls. Balanced mode automatically
      # favors power saving on battery with AMD P-State.
      services.power-profiles-daemon.enable = true;

      environment.systemPackages = [
        pkgs.pulseaudio
        pkgs.khal
      ];

      services.displayManager.dms-greeter = {
        enable = true;
        compositor.name = "hyprland";
      };

      services.displayManager.defaultSession = "hyprland-uwsm";

      programs.dms-shell = {
        enable = true;

        systemd = {
          enable = true; # Systemd service for auto-start
          restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
        };

      };
    };

}
