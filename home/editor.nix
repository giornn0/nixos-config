{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
  };
  # ......
  home.packages = with pkgs; [
    #Editor
    lldb
    hadolint
    erlang-ls
    elixir-ls # Elixir
    marksman # Markdown
    ltex-ls
    texlab # LaTeX
    taplo # Toml
    postgres-lsp
    shfmt
    pgformatter
    markdownlint-cli
    nodePackages.bash-language-server # Bash
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.vscode-langservers-extracted
    nodePackages.stylelint
    nodePackages.graphql-language-service-cli
    #INFO: This are installed globally or
    #through nix-shell with lorry daemon
    # nodePackages.svelte-language-server # Svelte
    # nodePackages.typescript
    # nodePackages.typescript-language-server
    # nodePackages."@vtsls/language-server"
    # nodePackages."@angular/language-server"
    eslint_d
    nodePackages.prettier
    biome
    nodePackages.yaml-language-server # YAML / JSON
    yamllint
    yamlfmt
    tailwindcss-language-server
    lua-language-server #LUA
    stylua
    selene
    emmet-ls
    vimPlugins.crates-nvim
    alejandra #nix formatter
    nil
    tree-sitter
    zls

    #TODO: Pending to look for an auto install of rust-analyzer
    # rust-analyzer
  ];
  # ......
}
