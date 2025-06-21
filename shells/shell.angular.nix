{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs-slim_24
    angular-language-server
    tailwindcss-language-server
    typescript-language-server
    vscode-langservers-extracted
    nodePackages.prettier
    pnpm
    vtsls
    biome
    nodePackages.stylelint
    emmet-ls
  ];
}
