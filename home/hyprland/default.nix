{ config, lib, pkgs, inputs, ... }: {
  # ......
  #INFO: Utils
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./waybar.nix
    ./hyprlock.nix
    ./utils.nix
  ];
  home.packages = with pkgs; [ waybar swww ];
  wayland.windowManager.hyprland.systemd = {
    # enable = true;
    variables = [ "--all" ];
  };
  # hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland.override {
      legacyRenderer = true;
      mesa = pkgs.mesa;
    };
    extraConfig = ''
      ########################################################################################
          #AUTOGENERATED HYPR CONFIG.
          #PLEASE USE THE CONFIG PROVIDED IN THE GIT REPO /examples/hypr.conf AND EDIT IT,
          #OR EDIT THIS ONE ACCORDING TO THE WIKI INSTRUCTIONS.
          ########################################################################################

          #
          # Please note not all available settings / options are set here.
          # For a full list, see the wiki
          #

          # autogenerated = 1 # remove this line to remove the warning

          # See https://wiki.hyprland.org/Configuring/Monitors/
          monitor=,preferred,auto,auto

          # See https://wiki.hyprland.org/Configuring/Keywords/ for more
          # To allow screensharing
          # exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
          # Fix slow startup
          exec-once =  killXDG_Desktops
          exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
          exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
          exec-once = systemctl --user start xdg-desktop-portal-gtk
          exec-once = systemctl --user start xdg-desktop-portal-hyprland
          # Locker
          # exec-once = hyprlock

          # Setup clipboard handler
          exec-once = wl-clipboard-history -t
          exec-once = wl-paste --watch cliphist store
          exec-once = rm "$HOME/.cache/cliphist/db"   #it'll delete history at every restart

          #Startup
          exec-once = swww init & sleep 0.5 && exec wallpaper_random
          exec-once = waybar & firefox


          # Source a file (multi-file configs)
          # source = ~/.config/hypr/myColors.conf

          # Some default env vars.
          env = XCURSOR_SIZE,24

          # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
          input {
              kb_layout = latam
              kb_variant =
              kb_model =
              kb_options =
              kb_rules =
            # console.keyMap = "la-latin1";
              follow_mouse = 1

              touchpad {
                  natural_scroll = no
              }

              sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
          }

          general {
              # See https://wiki.hyprland.org/Configuring/Variables/ for more

              gaps_in = 5
              gaps_out = 20
              border_size = 2
              col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
              col.inactive_border = rgba(595959aa)

              layout = dwindle

              # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
              allow_tearing = false
          }

          decoration {
              # See https://wiki.hyprland.org/Configuring/Variables/ for more

              rounding = 10

              blur {
                  enabled = true
                  size = 3
                  passes = 1
              }

              # drop_shadow = yes
              # shadow_range = 4
              # shadow_render_power = 3
              # col.shadow = rgba(1a1a1aee)
          }

          animations {
              enabled = yes

              # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

              bezier = myBezier, 0.05, 0.9, 0.1, 1.05

              animation = windows, 1, 7, myBezier
              animation = windowsOut, 1, 7, default, popin 80%
              animation = border, 1, 10, default
              animation = borderangle, 1, 8, default
              animation = fade, 1, 7, default
              animation = workspaces, 1, 6, default
          }

          dwindle {
              # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
              pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
              preserve_split = yes # you probably want this
          }

          master {
              # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
              new_status = master
          }

          gestures {
              # See https://wiki.hyprland.org/Configuring/Variables/ for more
              workspace_swipe = off
          }

          misc {
              # See https://wiki.hyprland.org/Configuring/Variables/ for more
              # force_default_wallpaper = -1 # Set to 0 to disable the anime mascot wallpapers
          }

          # Example per-device config
          # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
          # device:epic-mouse-v1 {
          #     sensitivity = -0.5
          # }

          # Example windowrule v1
          # windowrule = float, ^(kitty)$
          # Example windowrule v2
          # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

          # windowrule=float,^(kitty)$
          # windowrule=float,^(pavucontrol)$
          # windowrule=center,^(kitty)$
          # windowrule=float,^(blueman-manager)$
          # windowrule=size 600 500,^(kitty)$
          # windowrule=size 934 525,^(mpv)$
          # windowrule=float,^(mpv)$
          # windowrule=center,^(mpv)$
          # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
          windowrulev2 = opacity 0.0 override,class:^(xwaylandvideobridge)$
          windowrulev2 = noanim,class:^(xwaylandvideobridge)$
          windowrulev2 = noinitialfocus,class:^(xwaylandvideobridge)$
          windowrulev2 = maxsize 1 1,class:^(xwaylandvideobridge)$
          windowrulev2 = noblur,class:^(xwaylandvideobridge)$


          # See https://wiki.hyprland.org/Configuring/Keywords/ for more
          $mainMod = SUPER
          bind = $mainMod, G, fullscreen,
          # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
          bind = $mainMod, Q, exec, kitty
          bind = $mainMod, C, killactive,
          bind = $mainMod, M, exit,
          bind = $mainMod, E, exec, nautilus
          bind = $mainMod, V, togglefloating,
          bind = $mainMod, P, pseudo, # dwindle
          bind = $mainMod, O, togglesplit, # dwindle
          bind = $mainMod, I, exec, firefox # internet
          bind = $mainMod, X, exec, wleave # session
          bind = $mainMod, T, exec, wofi --show drun
          bind = $mainMod, R, exec, rofiWindow
          bind = $mainMod, W, exec, wallpaper_random

          # Move focus with mainMod + arrow keys
          bind = $mainMod, H, movefocus, l
          bind = $mainMod, L, movefocus, r
          bind = $mainMod, J, movefocus, u
          bind = $mainMod, K, movefocus, d

          # Switch workspaces with mainMod + [0-9]
          bind = $mainMod, 1, workspace, 1
          bind = $mainMod, 2, workspace, 2
          bind = $mainMod, 3, workspace, 3
          bind = $mainMod, 4, workspace, 4
          bind = $mainMod, 5, workspace, 5
          bind = $mainMod, 6, workspace, 6
          bind = $mainMod, 7, workspace, 7
          bind = $mainMod, 8, workspace, 8
          bind = $mainMod, 9, workspace, 9
          bind = $mainMod, 0, workspace, 10

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          bind = $mainMod SHIFT, 1, movetoworkspace, 1
          bind = $mainMod SHIFT, 2, movetoworkspace, 2
          bind = $mainMod SHIFT, 3, movetoworkspace, 3
          bind = $mainMod SHIFT, 4, movetoworkspace, 4
          bind = $mainMod SHIFT, 5, movetoworkspace, 5
          bind = $mainMod SHIFT, 6, movetoworkspace, 6
          bind = $mainMod SHIFT, 7, movetoworkspace, 7
          bind = $mainMod SHIFT, 8, movetoworkspace, 8
          bind = $mainMod SHIFT, 9, movetoworkspace, 9
          bind = $mainMod SHIFT, 0, movetoworkspace, 10

          # Example special workspace (scratchpad)
          bind = $mainMod, S, togglespecialworkspace, magic
          bind = $mainMod SHIFT, S, movetoworkspace, special:magic

          # Scroll through existing workspaces with mainMod + scroll
          bind = $mainMod, mouse_down, workspace, e+1
          bind = $mainMod, mouse_up, workspace, e-1

          # Move/resize windows with mainMod + LMB/RMB and dragging
          bindm = $mainMod, mouse:272, movewindow
          bindm = $mainMod, mouse:273, resizewindow
          # Clipboard bind
          bind = SUPER,SPACE,exec,cliphist list | wofi --show dmenu -H 600 -W 900   | cliphist decode | wl-copy

          # screenshot
          # # area
          bind = , Print, exec, grimblast --notify copysave area
          bind = $mainMod SHIFT, R, exec, grimblast --notify copysave area
          # current screen
          bind = CTRL, Print, exec, grimblast --notify --cursor copysave output
          bind = $mainMod SHIFT CTRL, R, exec, grimblast --notify --cursor copysave output
          # all screens
          bind = ALT, Print, exec, grimblast --notify --cursor copysave screen
          bind = $mainMod SHIFT ALT, R, exec, grimblast --notify --cursor copysave screen

          #Clean middle click paste (check how to allow the new tab)
          bind = , mouse:274, exec, ;
    '';
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
  # ......
}
