{
  programs.nixvim.plugins.gitsigns= {
    enable = true;
    settings = {
      signs.untracked.text = "|";
      current_line_blame = true;
    };
  };
}
