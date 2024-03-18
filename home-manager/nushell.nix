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
      os-clean = "sudo nix-collect-garbage --delete-older-than 1d";
      upgrade = "sudo nixos-rebuild switch --upgrade-all";
      nixos-optimise = "nix-store --optimise";
      /*
      nixos-cleanup = "nix-store --gc --print-roots | egrep -v \"^(/nix/var|/run/\w+-system|\{memory|/proc)\"";
      */
      ls = "eza -l --hyperlink --header";
      cd = "z";
      exit-work = "podman stop --all and exit";
    };
    extraEnv = ''
      $env.config.show_banner = false;
      $env.EDITOR = "nvim";
      $env.BROWSER = "firefox";
      $env.TERMINAL = "alacritty";
    '';
  };
  # ......
}
