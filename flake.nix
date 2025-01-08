{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    neovim-flake.url = "github:lkarasinski/neovim-flake";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    cbtxt = pkgs.callPackage ./pkgs/cbtxt.nix {};
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        (import ./hosts/nixos)
        {
          environment.systemPackages = [cbtxt];
          nixpkgs.config.allowUnfree = true;
          nix.nixPath = ["nixpkgs=${nixpkgs}"];
        }
      ];
    };

    homeConfigurations.lkarasinski = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
        stylix.homeManagerModules.stylix
        ./modules/home/default.nix
        {home.packages = [cbtxt];}
      ];
      extraSpecialArgs = {
        inherit inputs outputs;
      };
    };
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
