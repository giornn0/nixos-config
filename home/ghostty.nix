{ pkgs, ... }: {
  # ......

  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "FiraCode Nerd Font";
      cursor-style-blink = true;
      term = "-256color";
      fullscreen = true;

      #    foreground = "f8f8f2";
      #    background = "000000";

      font-feature = "-ss20";
      background = "#0D1116";
      foreground = "#ebfafa";

      # cursor-color = "#8fee96";
      # cursor-color = "#F712FF";
      cursor-color = "#19dfcf";

      font-size = 13;
      font-thicken = true;

      macos-titlebar-style = "hidden";
      window-decoration = false;
      background-opacity = 0.75;

      window-padding-x = "3,2";
      window-padding-y = "3,2";

      cursor-style = "block_hollow";

      macos-icon = "custom-style";

      macos-icon-ghost-color = "#DFEBF5";
      macos-icon-screen-color = "#74B0CF";
      # black
      palette = [
        "0=#0d1116"
        "8=#5fa9f4"
        # red
        "1=#f16c75"
        "9=#f16c75"
        # green
        "2=#37f499"
        "10=#37f499"
        # yellow
        "3=#19dfcf"
        "11=#19dfcf"
        # blue
        "4=#987afb"
        "12=#987afb"
        # purple
        "5=#949ae5"
        "13=#949ae5"
        # aqua
        "6=#04d1f9"
        "14=#04d1f9"
        # white
        "7=#ebfafa"
        "15=#ebfafa"
      ];
    };
  };
}
