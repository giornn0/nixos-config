{ pkgs, ... }: {
  # ......
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
