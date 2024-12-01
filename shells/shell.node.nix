#TODO:this shell allows access to standard node utils
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
