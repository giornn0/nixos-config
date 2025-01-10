{ config, lib, pkgs, ... }: {
  # ......
  services.lorri.enable = true;
  programs.direnv = { enable = true; };
  #INFO: How to use:
  #lorri init
  # - Copy the shell content (that it's saved in shells folder from this repo) into the created shell.nix file 
  #direnv allow (90% of the time)
  #lorri watch 
  #- Wait for the build to complete, and you will have a development environment

  # ......
}
