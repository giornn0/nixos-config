{ config, lib, pkgs, ... }: {
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
      flake-upgrade = "sudo nix flake update";
      nixos-optimise = "nix-store --optimise";
      android-open = "nix-shell ~/.nixos_config/shells/shell.android.nix";
      angular-open = "nix-shell ~/.nixos_config/shells/shell.angular.nix";
      gleam-open = "nix-shell ~/.nixos_config/shells/shell.gleam.nix";
      node-open = "nix-shell ~/.nixos_config/shells/shell.node.nix";
      php-open = "nix-shell ~/.nixos_config/shells/shell.php.nix";
      rust-open = "nix-shell ~/.nixos_config/shells/shell.rust.nix";
      # nixos-cleanup = "nix-store --gc --print-roots | egrep -v \"^(/nix/var|/run/\w+-system|\{memory|/proc)\"";
      netbird-clean =
        "sudo rm -rf /var/lib/netbird /etc/netbird /usr/local/bin/netbird";
      ls = "eza -l --hyperlink --header";
      cd = "z";
      exit-pd = "podman stop --all";
    };
    extraConfig = ''
      ^ssh-agent -c
          | lines
          | first 2
          | parse "setenv {name} {value};"
          | transpose -r
          | into record
          | load-env
    '';
    extraEnv = ''
      $env.config = ($env.config | upsert show_banner false)
      $env.EDITOR = "nvim";
      $env.BROWSER = "firefox";
      $env.CHROME_BIN = "brave";
      $env.CHROMIUM_BIN = "brave";
      $env.TERMINAL = "alacritty";
      $env.PATH = ($env.PATH | split row (char esep)
          | append '${config.home.homeDirectory}/.cargo/bin'
          | uniq);
      neofetch
    '';
  };
  # ......
}
