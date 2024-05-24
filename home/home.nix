{
  config,
  lib,
  pkgs,
  ...
}: let
  userName = "giornn0";
in {
  imports = [
    ./hyprland/default.nix
    (import ./alacritty.nix {inherit config lib pkgs;})
    (import ./editor.nix {inherit config lib pkgs;})
    (import ./helix.nix {inherit config lib pkgs;})
    (import ./lorri.nix {inherit config lib pkgs;})
    (import ./nushell.nix {inherit config lib pkgs;})
    (import ./scripts.nix {inherit config lib pkgs;})
    (import ./rofi/default.nix {inherit config lib pkgs;})
    (import ./starship.nix {inherit config lib pkgs;})
  ];
  # TODO please change the username & home direcotry to your own
  home.username = userName;
  home.homeDirectory = "/home/${userName}";

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
    userName = userName;
    userEmail = "rusty.arrebol@proton.me";
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
    # neovim
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
    killport #An option to kill process on specific ports
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
    tty-clock
    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    glow # markdown previewer in terminal

    #INFO: For RDP
    remmina
    krita
    #Terminal
    # xclip
    #CLI
    yarn
    rustup
    lazygit
    zig
    gleam
    elixir
    erlang
    #INFO: Extras needs
    mold
    livebook
    # direnv
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
    NIX_BUILD_SHELL = "nu";
    # ANDROID_HOME = "/home/giornn0/Android/Sdk";
    __GL_VRR_ALLOWED = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
    CLUTTER_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";

    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
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
  # services.lorri.enable = true;
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
