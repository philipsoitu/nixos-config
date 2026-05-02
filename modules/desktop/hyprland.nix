{ self, inputs, ... }:
{
  flake.nixosModules.hyprland =
    { pkgs, lib, ... }:
    {
      programs.hyprland = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      };
    };

  perSystem =
    { pkgs, lib, ... }:
    let
      hyprlandConfig = pkgs.writeText "hyprland.conf" ''
        monitor=,preferred,auto,auto

        exec-once = sleep 1 && waybar
        exec-once = sleep 2 && hyprpaper
        exec-once = dunst

        $terminal = ghostty
        $fileManager = dolphin
        $menu = wofi --show drun

        env = XCURSOR_SIZE,24
        env = HYPRCURSOR_SIZE,24

        general {
            gaps_in = 2
            gaps_out = 4
            border_size = 2
            col.active_border = rgba(458588aa) rgba(98971aaa) 45deg
            col.inactive_border = rgba(595959aa)
            resize_on_border = true
            allow_tearing = false
            layout = dwindle
        }

        decoration {
            rounding = 0
            active_opacity = 1.0
            inactive_opacity = 1.0

            shadow {
                enabled = true
                range = 4
                render_power = 3
                color = rgba(1a1a1aee)
            }

            blur {
                enabled = true
                size = 3
                passes = 1
                vibrancy = 0.1696
            }
        }

        animations {
            enabled = 0
        }

        dwindle {
            pseudotile = true
            preserve_split = true
        }

        master {
            new_status = master
        }

        misc {
            force_default_wallpaper = 0
            disable_hyprland_logo = true
        }

        input {
            kb_layout = us
            kb_variant =
            kb_model =
            kb_options =
            kb_rules =
            follow_mouse = 1
            sensitivity = 0

            touchpad {
                natural_scroll = false
            }
        }

        device {
            name = epic-mouse-v1
            sensitivity = -0.5
        }

        bind = , Print, exec, sh -c 'mkdir -p ~/screenshot && hyprshot -m region -o ~/screenshot'

        bind = SUPER, RETURN, exec, $terminal
        bind = SUPER_SHIFT, Q, killactive,
        bind = SUPER, M, exit,
        bind = SUPER, E, exec, $fileManager
        bind = SUPER, V, togglefloating,
        bind = SUPER, D, exec, $menu
        bind = SUPER, P, pseudo,
        bind = SUPER, J, togglesplit,

        bind = SUPER, left, movefocus, l
        bind = SUPER, right, movefocus, r
        bind = SUPER, up, movefocus, u
        bind = SUPER, down, movefocus, d

        bind = SUPER, 1, workspace, 1
        bind = SUPER, 2, workspace, 2
        bind = SUPER, 3, workspace, 3
        bind = SUPER, 4, workspace, 4
        bind = SUPER, 5, workspace, 5
        bind = SUPER, 6, workspace, 6
        bind = SUPER, 7, workspace, 7
        bind = SUPER, 8, workspace, 8
        bind = SUPER, 9, workspace, 9
        bind = SUPER, 0, workspace, 10

        bind = SUPER_SHIFT, 1, movetoworkspace, 1
        bind = SUPER_SHIFT, 2, movetoworkspace, 2
        bind = SUPER_SHIFT, 3, movetoworkspace, 3
        bind = SUPER_SHIFT, 4, movetoworkspace, 4
        bind = SUPER_SHIFT, 5, movetoworkspace, 5
        bind = SUPER_SHIFT, 6, movetoworkspace, 6
        bind = SUPER_SHIFT, 7, movetoworkspace, 7
        bind = SUPER_SHIFT, 8, movetoworkspace, 8
        bind = SUPER_SHIFT, 9, movetoworkspace, 9
        bind = SUPER_SHIFT, 0, movetoworkspace, 10

        bind = SUPER, S, togglespecialworkspace, magic
        bind = SUPER_SHIFT, S, movetoworkspace, special:magic

        bind = SUPER, mouse_down, workspace, e+1
        bind = SUPER, mouse_up, workspace, e-1

        bindm = SUPER, mouse:272, movewindow
        bindm = SUPER, mouse:273, resizewindow

        bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
        bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
        bindel = ,XF86MonBrightnessUp, exec, brightnessctl s 10%+
        bindel = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-

        bindl = , XF86AudioNext, exec, playerctl next
        bindl = , XF86AudioPause, exec, playerctl play-pause
        bindl = , XF86AudioPlay, exec, playerctl play-pause
        bindl = , XF86AudioPrev, exec, playerctl previous
      '';
    in
    {
      packages.hyprland = inputs.wrappers.lib.wrapPackage {
        inherit pkgs;
        package = pkgs.hyprland;

        args = [
          "--config"
          "${hyprlandConfig}"
        ];

        runtimeInputs = with pkgs; [
          self.packages.${pkgs.stdenv.hostPlatform.system}.waybar
          self.packages.${pkgs.stdenv.hostPlatform.system}.hyprpaper
          dunst
          ghostty
          kdePackages.dolphin
          wofi
          hyprshot
          wireplumber
          brightnessctl
          playerctl
        ];
      };
    };
}
