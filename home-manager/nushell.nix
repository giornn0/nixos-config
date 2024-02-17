{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };
  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };

  # ......
  programs.nushell = {
    enable = true;
    shellAliases = {
      os-update = "sudo nixos-rebuild switch";
      upgrade = "sudo nixos-rebuild switch --upgrade-all";
      nixos-optimise = "nix-store --optimise";
      /*
      nixos-cleanup = "nix-store --gc --print-roots | egrep -v \"^(/nix/var|/run/\w+-system|\{memory|/proc)\"";
      */
      ls = "eza -l --hyperlink --header";
      cd = "z";
      exit = "podman stop --all and exit";
    };
    extraEnv = ''
      $env.config.show_banner = false
    '';
  };
  # ......
}
