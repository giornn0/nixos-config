# TODO:this shell allows access to standard node utils
{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell rec {
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    nodejs-slim_24
    nodePackages.npm
    bun
    nodePackages.stylelint
    emmet-ls
    # nodePackages.eas-cli
  ];
}
