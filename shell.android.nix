#TODO:this shell allows to install rust crates that needs openssl
{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell rec {
    nativeBuildInputs = [pkg-config];
    buildInputs = [
      android-tools
      android-studio
      jdk17
    ];
  }
