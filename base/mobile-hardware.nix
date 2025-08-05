{ lib, ... }:

{
  #INFO:
  #AMD GPU config
  config = {

    boot.initrd.kernelModules = [ "amdgpu" ];

    services.xserver.videoDrivers = [ "amdgpu" ];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.amdgpu.initrd.enable = lib.mkDefault true;

    #INFO:
    #SSD CONFIG
    services.fstrim.enable = lib.mkDefault true;
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
