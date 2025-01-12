{ pkgs, ... }: {
  # ......

  programs.ghostty = {
    enable = true;
    settings = {
      foreground = "f8f8f2";
      background = "000000";
      font-family = "FiraCode Nerd Font";
      font-size = 16;
      cursor-style-blink = true;
      term = "256color";
      background-opacity = 0.8;
      fullscreen = true;
      cursor-color = "8fee96";

    };
  };
}
