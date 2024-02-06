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
    pgformatter
    nodePackages.bash-language-server # Bash
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.stylelint
    # nodePackages.svelte-language-server # Svelte
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server
    nodePackages.prettier
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
  ];

  # ......
}
