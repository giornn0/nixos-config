{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ twemoji-color-font ];
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      twemoji-color-font
      fira-code
      fira-code-symbols
      fira-code-nerdfont
      hack-font
      meslo-lgs-nf
      inconsolata
    ];
    enableDefaultPackages = true;
  };
}
