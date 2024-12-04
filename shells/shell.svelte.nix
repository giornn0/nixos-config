# TODO:this shell allows access to standard node utils
{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell rec {
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    nodejs-slim_22
    nodePackages.npm
    bun
    svelte-language-server
    tailwindcss-language-server
    emmet-ls
  ];
}
