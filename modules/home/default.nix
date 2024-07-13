{
	home = {
		username = "lkarasinski";
		homeDirectory = "/home/lkarasinski/";
		stateVersion = "24.05";
	};
	
    imports = [
      ./alacritty.nix
      ./git.nix
      ./packages.nix
      ./ssh.nix
      ./tmux.nix
      ./zsh.nix
  ];
}
