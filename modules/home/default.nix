{
	home = {
		username = "lkarasinski";
		homeDirectory = "/home/lkarasinski/";
		stateVersion = "24.05";
	};
	
    imports = [
      ./alacritty.nix
	  ./direnv.nix
	  ./fish.nix
      ./git.nix
      ./lazygit.nix
      ./packages.nix
      ./ssh.nix
      ./tmux.nix
  ];
}
