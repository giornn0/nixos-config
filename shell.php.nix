#TODO:this shell allows to install rust crates that needs openssl
{pkgs ? import <nixpkgs> {}}:
with pkgs;
  mkShell rec {
    nativeBuildInputs = [pkg-config];
    buildInputs = [
      php
      php82Packages.composer
    ];
  }
