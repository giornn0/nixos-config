# TODO:this shell allows to use erlang applications easily
{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell rec {
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    elixir_1_18
    #INFO: need for distillery builds
    # gnumake
    erlang_27
    erlang-ls
    elixir-ls # Elixir
  ];
}
