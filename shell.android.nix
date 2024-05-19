#TODO:this shell gives the tools to build mobile applications
{
  pkgs ?
    import <nixpkgs> {
      config.allowUnfree = true;
    },
}:
with pkgs;
  mkShell rec {
    nativeBuildInputs = [pkg-config];
    buildInputs = [
      android-tools
      android-studio
      jdk17
    ];
  }
