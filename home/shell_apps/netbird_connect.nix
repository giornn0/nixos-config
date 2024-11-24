{ pkgs }:

pkgs.writeShellApplication {
  name = "netbird_connect";
  runtimeInputs = [ pkgs.netbird ];
  text = ''
    netbird up
  '';
}
