{
  config,
  lib,
  pkgs,
  ...
}: {
  # ......
  programs.ion = {
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      upgrade = "sudo nixos-rebuild switch --upgrade-all";
      nixos-optimise = "nix-store --optimise";
      nixos-cleanup = "nix-store --gc --print-roots | egrep -v \"^(/nix/var|/run/\w+-system|\{memory|/proc)\"";
      ls = "eza -l --hyperlink --header";
      cd = "z";
    };
    initExtra = ''
      eval $(starship init ion)
    '';
  };
  # ......
}
