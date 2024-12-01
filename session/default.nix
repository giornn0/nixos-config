{ config, lib, pkgs, ... }: {
  programs.adb.enable = true;
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.giornn0 = {
    isNormalUser = true;
    description = "giornn0";
    shell = pkgs.nushell;
    extraGroups = [ "networkmanager" "wheel" "adbusers" "kvm" "plugdev" ];
    packages = with pkgs; [ firefox ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    curl
    # hyprpaper
    wl-clipboard
    nautilus
  ];

  # ......
}
