{
  config,
  lib,
  pkgs,
  ...
}: {
  #INFO: Clipboard
  programs.wofi.enable = true;
  services.cliphist.enable = true;

  home.packages = with pkgs; [
    # screenshot
    grim
    slurp
    grimblast

    # utils
    wl-clipboard
    # wlr-randr
    # wlroots

    #Possible need it to allow full screen sharing
    # xwaylandvideobridge
    wl-screenrec
    #Log out
    wleave

    #XDG Desktop
    xdg-desktop-portal-hyprland

    #Audio
    pamixer
    cava
  ];
}
