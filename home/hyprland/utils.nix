{ config, lib, pkgs, ... }: {
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
    xwaylandvideobridge
    wl-screenrec
    #Log out
    wleave

    #XDG Desktop
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk

    #Audio
    pamixer
    cava

    #To allow screen sharing
    xwayland
    # meson
    wayland-protocols
    wayland-utils
    wlroots
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };
}
