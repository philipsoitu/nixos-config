{ self, inputs, ... }:
{
  flake.nixosModules.dms-shell =
    { pkgs, ... }:
    {
      services.upower.enable = true;

      environment.systemPackages = [
        pkgs.pulseaudio
      ];

      services.displayManager.dms-greeter = {
        enable = true;
        compositor.name = "hyprland";
      };

      programs.dms-shell = {
        enable = true;

        systemd = {
          enable = true; # Systemd service for auto-start
          restartIfChanged = true; # Auto-restart dms.service when dms-shell changes
        };

        # Core features
        enableSystemMonitoring = true; # System monitoring widgets (dgop)
        enableVPN = true; # VPN management widget
        enableDynamicTheming = true; # Wallpaper-based theming (matugen)
        enableAudioWavelength = true; # Audio visualizer (cava)
        enableCalendarEvents = true; # Calendar integration (khal)
      };
    };

}
