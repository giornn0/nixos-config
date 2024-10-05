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
      php-open = "nix-shell ~/.nixos_config/shell.php.nix";
      android-open = "nix-shell ~/.nixos_config/shell.android.nix";
      node-open = "nix-shell ~/.nixos_config/shell.node.nix";
      gleam-open = "nix-shell ~/.nixos_config/shell.gleam.nix";
      rust-open = "nix-shell ~/.nixos_config/shell.rust.nix";
      # nixos-cleanup = "nix-store --gc --print-roots | egrep -v \"^(/nix/var|/run/\w+-system|\{memory|/proc)\"";
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
      $env.config.hooks = {
        env_change : {PWD : { || if (which direnv | is-empty) { return }
            direnv export json | from json | default {} | load-env
        }}
      };
      $env.config = ($env.config | upsert show_banner false)
      $env.EDITOR = "nvim";
      $env.BROWSER = "firefox";
      $env.CHROME_BIN = "brave";
      $env.CHROMIUM_BIN = "brave";
      $env.TERMINAL = "alacritty";
      $env.PATH = ($env.PATH | split row (char esep)
          | append '${config.home.homeDirectory}/.cargo/bin'
          | append '${config.home.homeDirectory}/.npm/bin'
          | uniq);
      neofetch
    '';
  };
  # ......
}
