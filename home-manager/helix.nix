{
  config,
  lib,
  pkgs,
  ...
}: {
  # ......
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
        C-s = ":w";
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
  # ......
}
