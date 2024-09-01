{ config, pkgs, ... }: {
	programs.fish = {
		enable = true;

		plugins = [
			{ name = "grc"; src = pkgs.fishPlugins.grc.src; }
			{
				name = "z";
				src = pkgs.fetchFromGitHub {
					owner = "jethrokuan";
					repo = "z";
					rev = "e0e1b9dfdba362f8ab1ae8c1afc7ccf62b89f7eb";
					sha256 = "0dbnir6jbwjpjalz14snzd3cgdysgcs3raznsijd6savad3qhijc";
				};
			}
			{ name = "sponge"; src = pkgs.fishPlugins.sponge.src; }
			{ name = "fzf"; src = pkgs.fishPlugins.fzf.src; }
			{ name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
		];

		shellAliases =
		  let
			flakeDir = "~/nix";
		  in {
		  rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
		  upd-nvim = "nix flake update --override-input neovim-flake github:lkarasinski/neovim-flake";

		  upd = "nix flake update ${flakeDir}";
		  upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

		  hms = "home-manager switch --flake ${flakeDir}";

		  pkgs = "nvim ${flakeDir}/modules/home/packages.nix";

		  ff = "fastfetch";

		  forti = "tmuxp load ~/tmux-sessions/forti.yaml";
		  ksc = "tmuxp load ~/tmux-sessions/ksc.yaml";
		};
	};
}
