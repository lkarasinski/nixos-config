{ config, pkgs, ... }: {
	home = {
		username = "lkarasinski";
		homeDirectory = "/home/lkarasinski/";
		stateVersion = "24.05";
	};
	
	imports = [
		./modules/bundle.nix
	];
}
