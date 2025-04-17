{
  description = "Nixos config flake";

  inputs = {
    
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    musnix  = { 
      url = "github:musnix/musnix"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    playit-nixos-module.url = "github:pedorich-n/playit-nixos-module";
    # local package neovim config
    # neovim-conf.url = "flake:modules/flakes/nixos-conf#nixos-conf";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      packages.${system}.neovim-conf = (
        inputs.nvf.lib.neovimConfiguration {
          # same as pkgs = pkgs
          inherit pkgs;
          modules = [./pkgs/nvf/package.nix];
        }
      ).neovim;

      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            # neovim-conf = self.packages.${system}.neovim-conf;
            inherit (self.packages.${system}) neovim-conf;
          };
          modules = [ 
            ./hosts/default/configuration.nix
          ];
        };
    };
}
