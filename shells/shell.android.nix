#TODO:this shell gives the tools to build mobile applications
{
  pkgs ?
    import <nixpkgs> {
      config.allowUnfree = true;
    },
}:
with pkgs;
  mkShell rec {
    nativeBuildInputs = [pkg-config];
    buildInputs = [
      #INFO: For mobile dev
      android-tools
      android-studio
      android-udev-rules
      jdk17
      usbutils
      android-file-transfer
      aapt
      gradle
    ];
    ANDROID_HOME = "${config.home.homeDirectory}/Android/Sdk";
    # ANDROID_HOME = "/home/giornnomobile/Android/Sdk";
  }
