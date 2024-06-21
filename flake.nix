{
  description = "NixOS main configuration for the home-manager, i3 and xterm";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: 
let
      forAllSystems = nixpkgs.lib.genAttrs [ "x86_64-linux" ];
      system = "x86_64-linux";
      packages = forAllSystems (system:
      	  let pkgs = nixpkgs.legacyPackages.${system};
          in import ./pkgs { inherit pkgs; }
    	);
in {
      devShells = forAllSystems (
          system: import ./dev-shells { pkgs = nixpkgs.legacyPackages.${system}; inherit packages; }
      );

      nixosConfigurations = { 
        off = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nasm = import ./home.nix { pkgs = nixpkgs.legacyPackages.${system}; inherit packages; lib = nixpkgs.lib; };
          }
        ];
      };
    };
  };
}
