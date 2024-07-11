{
	programs.nixvim = {
		clipboard = {
			register = "unnamedplus";
			providers.wl-copy.enable = true;
		};

		opts = {
			relativenumber = true;
			number = true;
			tabstop = 4;
			shiftwidth = 4;
			expandtab = false;
			scrolloff = 8;
			signcolumn = "yes";
			termguicolors = true;
			wrap = false;
			undofile = true;
		};
	};
}
