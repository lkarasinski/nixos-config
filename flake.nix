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
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ...}@inputs: 
  let 
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgsUnstable = import nixpkgs-unstable { inherit system; };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        (import ./hosts/nixos)
      ];
    };

    homeConfigurations.lkarasinski = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./modules/home/default.nix ];
      extraSpecialArgs = { inherit inputs pkgsUnstable outputs; };
    };
  };
}
