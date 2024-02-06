{
  config,
  lib,
  pkgs,
  ...
}: {
  # ......
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "tokyonight_storm";
      default_shell = "zsh";
    };
  };

  # ......
}
