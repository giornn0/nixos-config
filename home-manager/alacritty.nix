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
          family = "Hack";
          style = "Retina";
        };
        bold = {
          family = "Hack";
          style = "Bold";
        };
        italic = {
          family = "Fira Code";
        };
      };
      selection.save_to_clipboard = true;
      shell.program = "${pkgs.zsh}/bin/zsh";
      window = {
        opacity = 0.85;
        decorations = "full";
      };
    };
  };

  # ......
}
