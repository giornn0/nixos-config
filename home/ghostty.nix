{ ... }: {
  # ......

  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "FiraCode Nerd Font";
      cursor-style-blink = true;
      fullscreen = true;
      font-feature = [ "calt" "liga" "dlig" ];
      font-size = 13;

      macos-titlebar-style = "hidden";
      window-decoration = false;
      background-opacity = 0.75;

      window-padding-x = "3,2";
      window-padding-y = "4,2";

      cursor-style = "block_hollow";

      macos-icon = "custom-style";

      macos-icon-ghost-color = "#DFEBF5";
      macos-icon-screen-color = "#74B0CF";

      keybind = [
        "ctrl+a>n=new_window"
        "ctrl+t>n=new_tab"
        "ctrl+t>h=previous_tab"
        "ctrl+t>l=next_tab"
        "ctrl+t>x=close_surface"
      ];
    };
    themes = {
      catppuccin-mocha = {
        # background = "1e1e2e";
        # cursor-color = "f5e0dc";
        # foreground = "cdd6f4";
        background = "#0D1116";
        foreground = "#ebfafa";

        # cursor-color = "#8fee96";
        # cursor-color = "#F712FF";
        cursor-color = "#19dfcf";

        palette = [
          "0=#45475a"
          "1=#f38ba8"
          "2=#a6e3a1"
          "3=#f9e2af"
          "4=#89b4fa"
          "5=#f5c2e7"
          "6=#94e2d5"
          "7=#bac2de"
          "8=#585b70"
          "9=#f38ba8"
          "10=#a6e3a1"
          "11=#f9e2af"
          "12=#89b4fa"
          "13=#f5c2e7"
          "14=#94e2d5"
          "15=#a6adc8"
          # "0=#0d1116"
          # "8=#5fa9f4"
          # # red
          # "1=#f16c75"
          # "9=#f16c75"
          # # green
          # "2=#37f499"
          # "10=#37f499"
          # # yellow
          # "3=#19dfcf"
          # "11=#19dfcf"
          # # blue
          # "4=#987afb"
          # "12=#987afb"
          # # purple
          # "5=#949ae5"
          # "13=#949ae5"
          # # aqua
          # "6=#04d1f9"
          # "14=#04d1f9"
          # # white
          # "7=#ebfafa"
          # "15=#ebfafa"
        ];
        selection-background = "353749";
        selection-foreground = "cdd6f4";
      };
    };
  };

}
