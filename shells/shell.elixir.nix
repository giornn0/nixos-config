# TODO:this shell allows to use erlang applications easily
{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell rec {
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    elixir
    #INFO: need for distillery builds
    # gnumake
    erlang
    erlang-ls
    elixir-ls # Elixir
  ];
}
