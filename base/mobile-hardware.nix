{ lib, pkgs, ... }:

{
  #INFO:
  #AMD GPU config
  config = {

    boot.initrd.kernelModules = [ "amdgpu" ];

    # Load the amdgpu driver for both Xorg and Wayland
    services.xserver.videoDrivers = [ "amdgpu" ];

    #INFO:
    # Enable Steam
    programs.steam = {
      enable = true;
      extraCompatPackages =
        [ pkgs.proton-ge-bin ]; # Optional: Proton-GE for better compatibility
    };

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs;
          [
            amdvlk # AMD's official Vulkan driver
            # rocm-opencl-icd # OpenCL support
            # rocm-runtime # ROCm runtime
          ];
      };

      amdgpu.initrd.enable = true;
      amdgpu.amdvlk = {
        enable = true;
        support32Bit.enable = true;
      };
    };
    #INFO:
    #SSD CONFIG
    services.fstrim.enable = true;
    services.tlp = {
      enable = true;
      settings = {
        START_CHARGE_THRESH_BAT0 = 75; # Start charging at 75%
        STOP_CHARGE_THRESH_BAT0 = 80; # Stop charging at 80%
      };
    };

    #INFO:
    # Install essential gaming tools
    environment.systemPackages = with pkgs; [
      vulkan-tools # Vulkan utilities (vulkaninfo, etc.)
      mangohud # Performance overlay
      goverlay # GUI for MangoHud
      gamemode # Optimizations for games
    ];

    nixpkgs.config.allowUnfree = true;
    #INFO:
    # Enable gamemode service
    programs.gamemode.enable = true;

    #INFO:
    # Kernel parameters for AMD performance
    boot.kernelParams =
      [ "amdgpu.sg_display=0" ]; # Fixes issues on some ASUS laptops
  };

  #INFO:
  #Battery life durability
  # hardware.asus.battery = {
  #   chargeUpto =
  #     85; # Maximum level of charge for your battery, as a percentage.
  #   enableChargeUptoScript =
  #     true; # Whether to add charge-upto to environment.systemPackages. `charge-upto 85` temporarily sets the charge limit to 85%.
  # };

}
