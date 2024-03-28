{
  config,
  lib,
  pkgs,
  ...
}: {
  # ......
  home.packages = with pkgs; [
    #Editor
    lldb
    elixir_ls # Elixir
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
    # nodePackages.svelte-language-server # Svelte
    nodePackages.graphql-language-service-cli
    nodePackages.stylelint
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
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
    # nodePackages.typescript
    vimPlugins.crates-nvim
    #Pending to look for an auto install of rust-analyzer
    # rust-analyzer
    alejandra #nix formatter
    nil
    tree-sitter
    zls
  ];

  # ......
}
