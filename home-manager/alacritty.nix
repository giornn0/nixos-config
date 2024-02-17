{
  config,
  lib,
  pkgs,
  ...
}: {
  # ......
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        draw_bold_text_with_bright_colors = true;
        normal = {
          family = "Fira Code";
          style = "Retina";
        };
        bold = {
          family = "Fira Code";
          style = "Bold";
        };
        italic = {
          family = "Mononoki Nerd Font";
        };
      };
      selection.save_to_clipboard = true;
      shell.program = "${pkgs.ion}/bin/ion";
      window = {
        opacity = 0.85;
        decorations = "full";
      };
    };
  };

  # ......
}
