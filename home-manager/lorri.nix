{
  config,
  lib,
  pkgs,
  ...
}: {
  # ......
  services.lorri.enable = true;
  programs.direnv = {
    enable = true;
  };

  # ......
}
