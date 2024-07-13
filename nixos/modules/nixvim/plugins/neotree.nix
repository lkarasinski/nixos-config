{
	programs.nixvim.plugins.neo-tree = {
		enable = true;
		closeIfLastWindow = true;
        filesystem = {
          followCurrentFile.enabled = true;
          filteredItems = {
            visible = true;
            hideDotfiles = false;
            hideGitignored = true;
          };
        };
	};
}
