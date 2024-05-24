{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./settings.nix
  ];
  # ......
  services.xserver = {
    enable = true;
    # videosDrivers = ["nvidia"];
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  services.getty.autologinUser = "giornn0";
  hardware = {
    opengl.enable = true;
    # nvidia.modesetting.enable = true;
  };

  # hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # nvidiaPatches = true;
  };
  #INFO: Clipboard
  programs.wofi.enable = true;
  programs.wl-clipboard.enable = true;
  programs.cliphist.enable = true;

  #INFO: Utils
  programs.waybar.enable = true;
  programs.hyprpaper.enable = true;
  # ......
}
