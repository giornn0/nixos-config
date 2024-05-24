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

  services.getty.autologinUser = "giornn0";

  #INFO: Env Needed
  # environment.systemPackages = with pkgs; [
  #   hyprpaper
  #   wl-clipboard
  # ];
  #
  hardware.opengl = {
    enable = true;

    # if you also want 32-bit support (e.g for Steam)
    # driSupport32Bit = true;
    # package32 = pkgs-unstable.pkgsi686Linux.mesa.drivers;
  };
  # hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
  environment.variables.NIXOS_OZONE_WL = "1";
  # ......
}
