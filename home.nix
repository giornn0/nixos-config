{
  config,
  lib,
  pkgs,
  ...
}: {
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
    # config = {
    #   init = {
    #     defaultBranch = "main";
    #   };
    # };
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    #Some basic softwares
    insomnia
    beekeeper-studio
    telegram-desktop
    #Virtualization
    podman
    podman-compose
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    neofetch
    nnn # terminal file manager

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

    # misc
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    glow # markdown previewer in terminal

    #Terminal
    xclip
    zplug
    #CLI
    yarn

    #Editor
    lldb
    luaformatter
    elixir_ls # Elixir
    marksman # Markdown
    ltex-ls
    texlab # LaTeX
    taplo # Toml
    pgformatter
    nil # Nix
    nodePackages.bash-language-server # Bash
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.stylelint
    # nodePackages.svelte-language-server # Svelte
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server
    nodePackages.prettier
    nodePackages.yaml-language-server # YAML / JSON
    tailwindcss-language-server
    rnix-lsp
    sumneko-lua-language-server # Lua
    emmet-ls
    zathura
    # nodePackages.typescript
    gcc
    rustup
    #Pending to look for an auto install of rust-analyzer
    # rust-analyzer
    alejandra #nix formatter

    #Pending delete to avoid unfree licenses
    nodePackages.intelephense
    lazygit

    #Android
    android-tools
    android-studio
  ];

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        draw_bold_text_with_bright_colors = true;
        normal = {
          family = "Hack";
          style = "Retina";
        };
        bold = {
          family = "Hack";
          style = "Bold";
        };
        italic = {
          family = "Fira Code";
        };
      };
      selection.save_to_clipboard = true;
      shell.program = "${pkgs.zsh}/bin/zsh";
      window = {
        opacity = 0.85;
        decorations = "full";
      };
    };
  };
  programs.zsh = {
    enable = true;
    shellAliases = {
      update = "sudo nixos-rebuild switch";
      upgrade = "sudo nixos-rebuild switch --upgrade-all";
      ls = "eza -l --git -T --hyperlink --header ";
    };
    initExtra = ''
      [[ ! -f ${./.p10k.zsh} ]] || source ${./.p10k.zsh}
      export TERM=alacritty

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
      eval "$(zellij setup --generate-auto-start zsh)"
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
        {
          name = "romkatv/powerlevel10k";
          tags = [as:theme depth:1];
        }
      ];
    };
  };

  #Editor!
  programs.helix = {
    enable = true;
    themes = {
      blur_tokyonight_storm = {
        inherits = "tokyonight_storm";
        "ui.background" = {fg = "foreground";};
      };
    };
    settings = {
      theme = "blur_tokyonight_storm";
      editor = {
        cursorline = true;
        auto-completion = true;
        auto-format = true;
        bufferline = "multiple";
        shell = ["zsh" "-c"];
        rulers = [80];
        true-color = true;
        file-picker = {
          hidden = false;
        };
        whitespace.characters = {
          space = "·";
          nbsp = "⍽";
          tab = "→";
          newline = "⏎";
          tabpad = "·";
        };
        lsp.display-messages = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        auto-pairs = {
          "(" = ")";
          "{" = "}";
          "[" = "]";
          "\"" = "\"";
          "'" = "'";
          "<" = ">";
          "`" = "`";
        };
        indent-guides = {
          render = true;
          character = "⸽";
          skip-levels = 1;
        };
        statusline = {
          left = ["mode" "spinner"];
          # center = ["file-name"];
          right = ["version-control" "diagnostics" "selections" "position" "file-encoding" "file-line-ending" "file-type"];
          separator = "│";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
      };
      keys.normal = {
        space.e = "file_picker";
        space.w = ":w";
        Ctrl.s = ":w";
        space.c = ":bc";
        space.q = ":q";
        esc = ["collapse_selection" "keep_primary_selection"];
      };
    };
    languages = {
      language-server = {
        typescript-language-server = {
          command = "typescript-language-server";
          args = ["--stdio"];
          config.documentFormatting = false;
        };
        nil = {
          command = "nil";
          config.nil = {
            formatting.command = ["alejandra" "-q"];
          };
        };
        rust-analyzer = {
          config.rust-analyzer = {
            cargo.loadOutDirsFromCheck = true;
            checkOnSave.command = "clippy";
            procMacro.enable = true;
            lens = {
              references = true;
              methodReferences = true;
            };
            completion.autoimport.enable = true;
            experimental.procAttrMacros = true;
          };
        };
        tailwindcss-language-server = {
          command = "tailwindcss-language-server";
          args = ["-vvv" "--stdio"];
        };
      };
      language = [
        {
          name = "html";
          formatter = {
            command = "prettier";
            args = ["--write" "--parser" "html"];
          };
          auto-format = true;
          file-types = ["html"];
          language-servers = ["vscode-html-language-server" "emmet-ls" "tailwindcss-language-server"];
        }
        {
          name = "typescript";
          formatter = {
            command = "prettier";
            args = [
              "--write"
              "--parser"
              "typescript"
            ];
          };
          auto-format = true;
          language-servers = ["typescript-language-server" "eslint"];
        }
        {
          name = "javascript";
          formatter = {
            command = "prettier";
            args = [
              "--write"
              "--parser"
              "javascript"
            ];
          };
          auto-format = true;
          language-servers = ["typescript-language-server" "eslint"];
        }
        {
          name = "tsx";
          formatter = {
            command = "prettier";
            args = [
              "--write"
              "--parser"
              "tsx"
            ];
          };
          auto-format = true;
          language-servers = ["typescript-language-server" "eslint"];
        }
        {
          name = "jsx";
          formatter = {
            command = "prettier";
            args = [
              "--write"
              "--parser"
              "jsx"
            ];
          };
          auto-format = true;
          language-servers = ["typescript-language-server" "eslint"];
        }
        {
          name = "jsx";
          formatter = {
            command = "prettier";
            args = [
              "--write"
              "--parser"
              "typescript"
            ];
          };
          auto-format = true;
          language-servers = ["typescript-language-server" "eslint"];
        }
        {
          name = "rust";
          auto-format = true;
          file-types = ["rs" "rust"];
          language-servers = ["rust-analyzer"];
        }
        # { name = "c-sharp"; language-servers = [ "omnisharp" ]; }
        {
          name = "sql";
          formatter.command = "pg_format";
        }
        {
          name = "nix";
          language-servers = ["nil"];
        }
        {
          name = "json";
          language-servers = [
            {
              name = "vscode-json-language-server";
              except-features = ["format"];
            }
          ];
        }
        {
          name = "markdown";
          language-servers = [
            {
              name = "marksman";
              except-features = ["format"];
            }
            "ltex-ls"
          ];
        }
        {
          name = "tailwindcss";
          scope = "source.css";
          injection-regex = "(postcss|css|html)";
          file-types = ["css"];
          roots = ["tailwind.config.js" "tailwind.config.cjs"];
          language-servers = ["tailwindcss-language-server"];
        }
      ];
    };
  };
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "tokyonight_storm";
      default_shell = "zsh";
    };
  };

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;

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
