{ pkgs, inputs, ... }: {
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };
  # ......
  home.packages = with pkgs; [
    #Editor
    lldb
    hadolint
    erlang-ls
    elixir-ls # Elixir
    marksman # Markdown
    markdownlint-cli2
    ltex-ls
    texlab # LaTeX
    taplo # Toml
    postgres-lsp
    shfmt
    pgformatter
    nodePackages.bash-language-server # Bash
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.stylelint
    nodePackages.yaml-language-server # YAML / JSON
    yamllint
    yamlfmt
    lua-language-server # LUA
    stylua
    selene
    emmet-ls
    vimPlugins.crates-nvim
    haskellPackages.nixfmt
    nil
    tree-sitter
    zls
    #TODO: Pending to look for an auto install of rust-analyzer
    # rust-analyzer
    #Haskell
    haskellPackages.haskell-language-server
    haskellPackages.cabal-gild
  ];
  # ......
}
