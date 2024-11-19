{
  description = "Giornn0's Flake Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # neovim-flake.url = "github:neovim/neovim?dir=contrib";
    neovim-nightly-overlay=  {
url = "github:nix-community/neovim-nightly-overlay";
     # inputs.nixpkgs.follows = "nixpkgs";
# inputs.neovim-flake.url = "github:neovim/neovim?dir=contrib&rev=8b98642002d0506d20628683958cb5c97a0dad80"; 
};
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        "nixos" = lib.nixosSystem rec {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            # Import the configuration.nix here, so that the
            # old configuration file can still take effect.
            # Note: configuration.nix itself is also a Nixpkgs Module,
            ./base/configuration.nix
            ./session/default.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.giornn0 = import ./home/home.nix;
              home-manager.extraSpecialArgs = specialArgs;
            }
          ];
        };
      };
    };
}
