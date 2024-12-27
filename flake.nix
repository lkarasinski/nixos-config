{
  description = "My system configuration";

  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.05";

    neovim-flake.url = "github:lkarasinski/neovim-flake";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    ghostty.url = "github:ghostty-org/ghostty";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    stylix,
    ghostty,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgsUnstable = import nixpkgs-unstable {
      inherit system;
      nixpkgs.config.allowUnfree = true;
    };
    cbtxt = pkgsUnstable.callPackage ./pkgs/cbtxt.nix {};
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        (import ./hosts/nixos)
        {
          _module.args.pkgsUnstable = pkgsUnstable;
          environment.systemPackages = [cbtxt ghostty.packages.x86_64-linux.default];
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
        inherit inputs pkgsUnstable outputs;
      };
    };
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
