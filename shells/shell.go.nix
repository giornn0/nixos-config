# TODO:this shell allows to use erlang applications easily
{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell rec {
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ go gopls ];
}
