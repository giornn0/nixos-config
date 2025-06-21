# TODO:this shell allows access to standard php utils
{ pkgs ? import <nixpkgs> { config.allowUnfree = true; }, }:
with pkgs;
mkShell rec {
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    php
    php84Packages.composer
    nodePackages.intelephense
    php84Packages.php-cs-fixer
  ];
}
