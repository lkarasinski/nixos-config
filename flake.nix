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

    sps-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    sops-nix,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    pkgsUnstable = import nixpkgs-unstable {
      inherit system;
      nixpkgs.config.allowUnfree = true;
    };
    cbtxt = pkgsUnstable.callPackage ./pkgs/cbtxt.nix {inherit (pkgsUnstable) wl-clipboard xclip;};
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        (import ./hosts/nixos)
        sops-nix.nixosModules.sops
        {
          _module.args.pkgsUnstable = pkgsUnstable;
          environment.systemPackages = [cbtxt];
          nixpkgs.config.allowUnfree = true;
          nix.nixPath = ["nixpkgs=${nixpkgs}"];
        }
      ];
    };

    homeConfigurations.lkarasinski = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [
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
