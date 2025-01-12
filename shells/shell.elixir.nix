# TODO:this shell allows to use erlang applications easily
{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell rec {
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    elixir
    #INFO: need for distillery builds
    # gnumake
    erlang_27
    erlang-ls
    elixir-ls # Elixir
  ];
}
