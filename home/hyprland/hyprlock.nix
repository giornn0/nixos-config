{...}: let
  font_family = "Noto";
in {
  programs.hyprlock.enable = true;
  programs.hyprlock.settings = {
    general = {
      disable_loading_bar = true;
      hide_cursor = false;
      no_fade_in = false;
    };

    background = [
      {
        monitor = "";
        path = "$HOME/.nixos_config/wallpapers/02.png";
      }
    ];

    input-field = [
      {
        monitor = {
          size = "200, 50";
          outline_thickness = 3;
          dots_size = 0.33; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          dots_rounding = -1; # -1 default circle, -2 follow input-field rounding
          outer_color = "rgb(151515)";
          inner_color = "rgb(FFFFFF)";
          font_color = "rgb(10, 10, 10)";
          fade_on_empty = true;
          fade_timeout = 1000; # Milliseconds before fade_on_empty is triggered.
          placeholder_text = "<i>Input Password...</i>"; # Text rendered in the input box when it's empty.
          hide_input = false;
          rounding = -1; # -1 means complete rounding (circle/oval)
          check_color = "rgb(204, 136, 34)";
          fail_color = "rgb(204, 34, 34)"; # if authentication failed, changes outer_color and fail message color
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>"; # can be set to empty
          fail_transition = 150; # transition time in ms between normal outer_color and fail_color
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1; # when both locks are active. -1 means don't change outer color (same for above)
          invert_numlock = false; # change color if numlock is off
          swap_font_color = false; # see below
          position = "0, -80";
          halign = "center";
          valign = "center";
        };
      }
    ];
    label = [
      {
        monitor = "";
        text = "$TIME";
        color = "rgba(200, 200, 200, 1.0)";
        font_size = "55";
        font_family = "${font_family}";
        shadow_passes = 5;
        shadow_size = 10;
        position = "0, 120";
        valign = "center";
        halign = "center";
      }
      {
        monitor = "";
        text = "$USER";
        color = "rgba(200, 200, 200, 1.0)";
        font_size = 20;
        font_family = "${font_family}";
        shadow_passes = 5;
        shadow_size = 10;
        position = "0, 65";
        valign = "center";
        halign = "center";
      }
    ];
  };
}
