{
  config,
  lib,
  pkgs,
  ...
}: {
  # ......
  programs.zellij = {
    enable = true;
    settings = {
      theme = "tokyonight_storm";
      default_shell = "nu";
    };
  };

  # ......
}
