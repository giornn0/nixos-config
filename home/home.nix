{ config, lib, pkgs, inputs, ... }:
let userName = "giornn0";
in {
  imports = [
    ./hyprland/default.nix
    ./themes/default.nix
    (import ./editor.nix { inherit config lib pkgs inputs; })
    (import ./ghostty.nix { inherit config lib pkgs inputs; })
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
    dbgate
    hoppscotch
    #For android debugging
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
    killall # for rofi
    killport # An option to kill process on specific ports
    htop
    feh
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

    lazygit
    #Zig
    zig
    inotify-tools
    #INFO: Extras needs
    mold
  ];
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "brave";
    TERMINAL = "ghostty";
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

  home.stateVersion = "25.05";
}
