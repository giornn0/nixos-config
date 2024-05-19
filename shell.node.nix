#TODO:this shell allows to install rust crates that needs openssl
{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell rec {
    nativeBuildInputs = [pkg-config];
    buildInputs = [
      nodejs-slim_20
      nodePackages.npm
      nodePackages.eas-cli
    ];
  }
