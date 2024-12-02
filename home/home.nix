{ config, lib, pkgs, inputs, ... }:
let userName = "giornn0";
in {
  imports = [
    ./hyprland/default.nix
    ./themes/default.nix
    (import ./alacritty.nix { inherit config lib pkgs; })
    (import ./editor.nix { inherit config lib pkgs inputs; })
    (import ./helix.nix { inherit config lib pkgs; })
    (import ./lorri.nix { inherit config lib pkgs; })
    (import ./neofetch.nix { inherit config lib pkgs; })
    (import ./nushell.nix { inherit config lib pkgs; })
    (import ./scripts.nix { inherit config lib pkgs; })
    (import ./rofi/default.nix { inherit config lib pkgs; })
    (import ./starship.nix { inherit config lib pkgs; })
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
      push = { autoSetupRemote = true; };
      pull = { rebase = true; };
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
    podman-compose
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    # neovim
    neofetch
    gcc

    # archives
    zip
    xz
    unzip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder
    zoxide # A modern replacement for cd
    fd # A modern replacement for find
    git-cliff # A modern changelog prettier
    killport # An option to kill process on specific ports
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
    unetbootin
    krita

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    glow # markdown previewer in terminal

    #INFO: For RDP
    remmina

    rustup
    lazygit
    #Zig
    zig
    #Elixir
    gleam
    elixir
    erlang
    #INFO: need for distillery builds
    # gnumake
    inotify-tools
    #Haskell
    ghc # Glasgow Haskell Compiler
    haskellPackages.cabal-install
    # haskellPackages.ghcup
    #INFO: Extras needs
    mold
    livebook
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
    NIX_BUILD_SHELL = "nu";
    __GL_VRR_ALLOWED = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
    NIXOS_OZONE_WL = "1";
    # WLR_RENDERER = "vulkan";
    CLUTTER_BACKEND = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
