# TODO:this shell allows to use erlang applications easily
{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell rec {
  nativeBuildInputs = [ pkg-config ];
  buildInputs = [
    ghc # Glasgow Haskell Compiler
    haskellPackages.cabal-install
    # haskellPackages.ghcup
    haskellPackages.haskell-language-server
    haskellPackages.cabal-gild
  ];
}
