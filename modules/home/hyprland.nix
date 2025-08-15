{ config, lib, pkgs, ... }:

{
  options.hyprland.enable = lib.mkEnableOption "Enable hyprland";

  config = lib.mkIf config.hyprland.enable {
    home.file.".config/hypr/hyprland.conf".text = ''
      # This is an example Hyprland config file.
      # Refer to the wiki for more information.
      # https://wiki.hyprland.org/Configuring/

      # Please note not all available settings / options are set here.
      # For a full list, see the wiki

      # You can split this configuration into multiple files
      # Create your files separately and then link them to this file like this:
      # source = ~/.config/hypr/myColors.conf

      ################
      ### MONITORS ###
      ################

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor=,preferred,auto,auto

      exec-once = sleep 1 && waybar
      exec-once = hyprpaper
      exec-once = dunst

      ###################
      ### MY PROGRAMS ###
      ###################

      # See https://wiki.hyprland.org/Configuring/Keywords/

      # Set programs that you use
      $terminal = ghostty
      $fileManager = dolphin
      $menu = wofi --show drun

      #################
      ### AUTOSTART ###
      #################

      # Autostart necessary processes (like notifications daemons, status bars, etc.)
      # Or execute your favorite apps at launch like this:

      # exec-once = $terminal
      # exec-once = nm-applet &
      # exec-once = waybar & hyprpaper & firefox


      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      # See https://wiki.hyprland.org/Configuring/Environment-variables/

      env = XCURSOR_SIZE,24
      env = HYPRCURSOR_SIZE,24


      #####################
      ### LOOK AND FEEL ###
      #####################

      # Refer to https://wiki.hyprland.org/Configuring/Variables/

      # https://wiki.hyprland.org/Configuring/Variables/#general
      general {
          gaps_in = 2
          gaps_out = 4

          border_size = 2

          # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
          col.active_border = rgba(458588aa) rgba(98971aaa) 45deg
          col.inactive_border = rgba(595959aa)

          # Set to true enable resizing windows by clicking and dragging on borders and gaps
          resize_on_border = true

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false

          layout = dwindle
      }

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration {
          rounding = 0

          # Change transparency of focused and unfocused windows
          active_opacity = 1.0
          inactive_opacity = 1.0

          shadow {
              enabled = true
              range = 4
              render_power = 3
              color = rgba(1a1a1aee)
          }

          # https://wiki.hyprland.org/Configuring/Variables/#blur
          blur {
              enabled = true
              size = 3
              passes = 1

              vibrancy = 0.1696
          }
      }

      # https://wiki.hyprland.org/Configuring/Variables/#animations
      animations {
          enabled = 0
      }

      # Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
      # "Smart gaps" / "No gaps when only"
      # uncomment all if you wish to use that.
      # workspace = w[tv1], gapsout:0, gapsin:0
      # workspace = f[1], gapsout:0, gapsin:0
      # windowrule = bordersize 0, floating:0, onworkspace:w[tv1]
      # windowrule = rounding 0, floating:0, onworkspace:w[tv1]
      # windowrule = bordersize 0, floating:0, onworkspace:f[1]
      # windowrule = rounding 0, floating:0, onworkspace:f[1]

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle {
          pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true # You probably want this
      }

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master {
          new_status = master
      }

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc {
          force_default_wallpaper = 0 # Set to 0 or 1 to disable the anime mascot wallpapers
          disable_hyprland_logo = true # If true disables the random hyprland logo / anime girl background. :(
      }

      #############
      ### INPUT ###
      #############

      # https://wiki.hyprland.org/Configuring/Variables/#input
      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =

          follow_mouse = 1

          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.

          touchpad {
              natural_scroll = false
          }
      }

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures {
          workspace_swipe = false
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      device {
          name = epic-mouse-v1
          sensitivity = -0.5
      }


      ###################
      ### KEYBINDINGS ###
      ###################

      bind = SUPER, RETURN, exec, $terminal
      bind = SUPER_SHIFT, Q, killactive,
      bind = SUPER, M, exit,
      bind = SUPER, E, exec, $fileManager
      bind = SUPER, V, togglefloating,
      bind = SUPER, D, exec, $menu
      bind = SUPER, P, pseudo, # dwindle
      bind = SUPER, J, togglesplit, # dwindle

      # Move focus with mainMod + arrow keys
      bind = SUPER, left, movefocus, l
      bind = SUPER, right, movefocus, r
      bind = SUPER, up, movefocus, u
      bind = SUPER, down, movefocus, d

      # Switch workspaces with mainMod + [0-9]
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

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
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

      # Example special workspace (scratchpad)
      bind = SUPER, S, togglespecialworkspace, magic
      bind = SUPER_SHIFT, S, movetoworkspace, special:magic

      # Scroll through existing workspaces with mainMod + scroll
      bind = SUPER, mouse_down, workspace, e+1
      bind = SUPER, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = SUPER, mouse:272, movewindow
      bindm = SUPER, mouse:273, resizewindow

      # Laptop multimedia keys for volume and LCD brightness
      bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
      bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      bindel = ,XF86MonBrightnessUp, exec, brightnessctl s 10%+
      bindel = ,XF86MonBrightnessDown, exec, brightnessctl s 10%-

      # Requires playerctl
      bindl = , XF86AudioNext, exec, playerctl next
      bindl = , XF86AudioPause, exec, playerctl play-pause
      bindl = , XF86AudioPlay, exec, playerctl play-pause
      bindl = , XF86AudioPrev, exec, playerctl previous

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

      # Example windowrule
      # windowrule = float,class:^(kitty)$,title:^(kitty)$

      # Ignore maximize requests from apps. You'll probably like this.
      windowrule = suppressevent maximize, class:.*

      # Fix some dragging issues with XWayland
      windowrule = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0

      windowrulev2 = float, title:^(Picture-in-Picture)$
      windowrulev2 = pin, title:^(Picture-in-Picture)$
      windowrulev2 = size 800 450, title:^(Picture-in-Picture)$

      # Firefox save/open dialogs issue fix
      windowrulev2 = float, title:^(Open File|Save As|Save File|Choose File)$
      windowrulev2 = center, title:^(Open File|Save As|Save File|Choose File)$
      windowrulev2 = size 900 600, title:^(Open File|Save As|Save File|Choose File)$

      # Logisim Evolution weird window behavior fix
      # Catch all Logisim windows
      windowrulev2 = float, class:^(com-cburch-logisim-Main)$

      # Force size + position of the main application window
      windowrulev2 = center, title:^(main of .* · Logisim-evolution.*)$
      windowrulev2 = size 1000 700, title:^(main of .* · Logisim-evolution.*)$
      windowrulev2 = move 100 100, title:^(main of .* · Logisim-evolution.*)$
    '';
  };
}
