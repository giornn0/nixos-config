{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    (import ./alacritty.nix {inherit config lib pkgs;})
    (import ./editor.nix {inherit config lib pkgs;})
    (import ./helix.nix {inherit config lib pkgs;})
    (import ./nushell.nix {inherit config lib pkgs;})
    (import ./starship.nix {inherit config lib pkgs;})
    (import ./zellij.nix {inherit config lib pkgs;})
  ];
  # TODO please change the username & home direcotry to your own
  home.username = "giornn0";
  home.homeDirectory = "/home/giornn0";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # set cursor size and dpi for 4k monitor
  #xresources.properties = {
  #  "Xcursor.size" = 16;
  # "Xft.dpi" = 172;
  #};

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "giornn0";
    userEmail = "shaaamsuu@gmail.com";
    extraConfig = {
      push = {autoSetupRemote = true;};
      pull = {rebase = false;};
      commit = {
        # gpgsign = true;
      };
    };
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    #Some basic softwares
    insomnia
    beekeeper-studio
    telegram-desktop
    #For android debugging
    brave
    #Virtualization
    podman
    podman-compose
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    neovim
    neofetch
    nnn # terminal file manager
    gcc

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    zoxide # A modern replacement for cd
    fd # A modern replacement for find
    git-cliff #A modern changelog prettier
    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    #utils
    zathura

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    glow # markdown previewer in terminal

    #INFO: For RDP
    remmina

    #Terminal
    xclip
    #CLI
    yarn
    rustup
    lazygit
    sea-orm-cli
    nodejs-slim_20
    #TODO: move to use in nix-shell
    nodePackages.npm
    nodePackages.eas-cli
    #Pending delete to avoid unfree licenses
    nodePackages.intelephense
    php
    #php82Packages.composer
    #Android
    android-tools
    android-studio
    jdk17
    #INFO: Extras needs
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
    # ANDROID_HOME = "/home/giornn0/Android/Sdk";
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";

  # services = {
  #   gpg-agent = {
  #     enable = true;
  #     defaultCacheTtl = 1800;
  #     enableSshSupport = true;
  #   };
  # };

  systemd.user.services.numLockOnTty = {
    Unit = {
      Description = "Auto Num Blq";
    };
    Install = {
      WantedBy = ["multi-user.target"];
    };
    Service = {
      # /run/current-system/sw/bin/setleds -D +num < "$tty";
      ExecStart = lib.mkForce (pkgs.writeShellScript "numLockOnTty" ''
        for tty in /dev/tty{1..6}; do
            ${pkgs.kbd}/bin/setleds -D +num < "$tty";
        done
      '');
    };
  };
}
