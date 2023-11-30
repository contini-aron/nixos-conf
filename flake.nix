{
  description = "My home flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager/release-23.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {self, nixpkgs, home-manager, ... }: 
    let
      lib = nixpkgs.lib;
      nixosSystem = nixpkgs.lib.nixosSystem;
      homeManagerConfiguration = home-manager.lib.homeManagerConfiguration;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
	nixos = nixosSystem {
          inherit system;
	  modules = [ 
	    ./configuration.nix 
	    ./vm.nix 
	    ];
	};
      };

      homeConfigurations = {
	aron = homeManagerConfiguration {
          inherit pkgs;
	  modules = [ ./home.nix ];
	};
      };
    };
}
