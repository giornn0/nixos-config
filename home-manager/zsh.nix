{
  config,
  lib,
  pkgs,
  ...
}: {
  # ......
  programs.zsh = {
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      upgrade = "sudo nixos-rebuild switch --upgrade-all";
      nixos-optimise = "nix-store --optimise";
      nixos-cleanup = "nix-store --gc --print-roots | egrep -v \"^(/nix/var|/run/\w+-system|\{memory|/proc)\"";
      ls = "eza -l --hyperlink --header";
    };
    initExtra = ''
      # Uncomment here if not using starship and want a fast style
      # [[ ! -f ${./.p10k.zsh} ]] || source ${./.p10k.zsh}
      export TERM=alacritty

      zstyle ':completion:*' special-dirs true

      bindkey -e

      bindkey "^[[7~"        beginning-of-line
      bindkey "^[[8~"        end-of-line
      bindkey "\e[2~"        overwrite-mode
      bindkey "\e[3~"        delete-char
      bindkey "^[Od"        backward-word
      bindkey "\e[1;5D"    backward-word
      bindkey "^[Oc"        forward-word
      bindkey "\e[1;5C"    forward-word
      bindkey "^[[A"         history-search-backward
      bindkey "^[[B"        history-search-forward
      bindkey "\e[5~"        history-beginning-search-backward
      bindkey "\e[6~"        history-beginning-search-forward
      bindkey "^W"        backward-delete-word

    '';
    zplug = {
      enable = true;
      plugins = [
        {name = "zsh-users/zsh-autosuggestions";} # Simple plugin installation
        {name = "zsh-users/zsh-history-substring-search";}
        {name = "zsh-users/zsh-syntax-highlighting";}
        {name = "hlissner/zsh-autopair";}
        {name = "greymd/docker-zsh-completion";}
        {name = "sroze/docker-compose-zsh-plugin";}
        #For fast style use powerlevel - for more control config starship
        # {
        #   name = "romkatv/powerlevel10k";
        #   tags = [as:theme depth:1];
        # }
      ];
    };
  };
  # ......
}
