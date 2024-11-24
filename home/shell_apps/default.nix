{ config, pkgs, lib }: {
  imports = [
    #Shells Apps
    (import ./netbird_connect.nix { inherit config lib pkgs; })
  ];
}

