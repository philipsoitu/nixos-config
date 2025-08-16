{ config, lib, pkgs, ... }:

{
  options.waybar.enable = lib.mkEnableOption "Enable waybar";

  config = lib.mkIf config.waybar.enable {
    programs.waybar = {
      enable = true;

      settings.mainBar = {
        layer = "top";
        position = "top";
        spacing = 0;
        height = 0;

        margin-top = 4;
        margin-right = 4;
        margin-bottom = 0;
        margin-left = 4;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "tray" "cpu_text" "cpu" "memory" "battery" "network" "pulseaudio" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          tooltip = false;
        };

        "tray" = {
          spacing = 10;
          tooltip = false;
        };

        "clock" = {
          format = "{:%I:%M %p - %a, %d %b %Y}";
          tooltip = false;
        };

        "cpu" = {
          format = "cpu {usage}%";
          interval = 2;

          "states" = {
            critical = 90;
          };
        };

        "memory" = {
          format = "mem {percentage}%";
          interval = 2;

          "states" = {
            critical = 80;
          };
        };

        "battery" = {
          format = "bat {capacity}%";
          interval = 5;
          "states" = {
            warning = 20;
            critical = 10;
          };
          tooltip = false;
        };

        "network" = {
          format-wifi = "conn.";
          format-ethernet = "conn.";
          format-disconnected = "disc.";
          interval = 5;
          tooltip = false;
        };

        "pulseaudio" = {
          scroll-step = 5;
          max-volume = 100;
          format = "vol {volume}%";
          format-bluetooth = "vol {volume}%";
          nospacing = 1;
          on-click = "pavucontrol";
          tooltip = false;
        };
      };

      style = ''
        * {
            border: none;
            border-radius: 0;
            min-height: 0;
            font-family: "JetBrainsMono Nerd Font", monospace;
            font-size: 12px;
            font-weight: 500;
            padding: 0;
        }

        window#waybar {
            background: #1d2021;
            border: 2px solid #3c3836;
        }

        tooltip {
            background-color: #1d2021;
            border: 2px solid #7c6f64;
        }

        #clock,
        #tray,
        #cpu,
        #memory,
        #battery,
        #network,
        #pulseaudio {
            margin: 6px 6px 6px 0px;
            padding: 2px 8px;
        }

        #workspaces {
            background-color: #303536;
            margin: 6px 0px 6px 6px;
            border: 2px solid #434a4c;
        }

        #workspaces button {
            all: initial;
            min-width: 0;
            box-shadow: inset 0 -3px transparent;
            padding: 2px 4px;
            color: #c7ab7a;
        }

        #workspaces button.focused {
            color: #ddc7a1;
        }

        #workspaces button.urgent {
            background-color: #e78a4e;
        }

        #clock {
            background-color: #303536;
            border: 2px solid #434a4c;
            color: #d4be98;
        }

        #tray {
            background-color: #d4be98;
            border: 2px solid #c7ab7a;
        }

        #battery {
            background-color: #a9b665;
            border: 2px solid #c7ab7a;
            color: #6c782e;
        }

        #cpu,
        #memory,
        #network,
        #pulseaudio {
            background-color: #ddc7a1;
            border: 2px solid #c7ab7a;
            color: #1d2021;
        }

        #cpu.critical,
        #memory.critical {
            background-color: #ddc7a1;
            border: 2px solid #c7ab7a;
            color: #c14a4a;
        }

        #battery.warning,
        #battery.critical,
        #battery.urgent {
            background-color: #ddc7a1;
            border: 2px solid #c7ab7a;
            color: #c14a4a;
        }
      '';
    };
  };
}
