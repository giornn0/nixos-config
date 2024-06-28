{ config, lib, pkgs, ... }: {
  # ......
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        # draw_bold_text_with_bright_colors = true;
        normal = {
          family = "Fira Code";
          style = "Retina";
        };
        bold = {
          family = "Fira Code";
          style = "Bold";
        };
        italic = { family = "Mononoki Nerd Font"; };
      };
      selection.save_to_clipboard = true;
      shell = {
        program = "${pkgs.nushell}/bin/nu";
        # args = ["options" "--default-shell" "nu"];
      };
      window = {
        opacity = 0.85;
        decorations = "full";
      };
    };
  };

  programs.kitty = {
    enable = true;
    extraConfig = ''
      # Shell
      shell ${pkgs.nushell}/bin/nu

      font_family FiraCode Nerd Font
      italic_font  auto
      # font_size 16.0

      # Theme
      foreground #f8f8f2
      background #000000

      # Cursor
      cursor #8fee96

      term xterm-256color
      background_opacity 0.8

      color0 #000000
      color8 #44475a

      color1 #ff5555
      color9 #ff5555

      color2 #59fa7b
      color10 #59fa7b

      color3 #f1fa8c
    '';
  };
  # ......
}
