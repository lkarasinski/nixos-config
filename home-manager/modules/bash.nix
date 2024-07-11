{
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --flake ~/nix";
			hms = "home-manager switch --flake ~/nix";
		};
	};
}
