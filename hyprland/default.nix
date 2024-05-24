{
  config,
  lib,
  pkgs,
  ...
}: {
  # imports = [
  #   ./settings.nix
  # ];
  # ......
  services.xserver = {
    enable = true;
    # videosDrivers = ["nvidia"];
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  # services.getty.autologinUser = "giornn0";

  #INFO: Env Needed
  # environment.systemPackages = with pkgs; [
  #   hyprpaper
  #   wl-clipboard
  # ];
  #
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
  # ......
}
