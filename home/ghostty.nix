{ pkgs, ... }: {
  # ......
  home.packages = with pkgs; [ ghostty ];

  # home.file.".config/ghostty/config".text = ''
  #   foreground = f8f8f2
  #   background = 000000
  #   font_family = "FiraCode Nerd Font"
  #   cursor-style = "block_hollow"
  #   cursor-style-blink = true
  #   term = "256color"
  #   background-opacity = 0.8
  #   fullscreen = true
  #   cursor-color = 8fee96
  # '';
}
