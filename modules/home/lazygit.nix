{
  programs.lazygit = {
    enable = true;
    settings = {
      services = {
        "gitlab.cbitt.nask.pl" = "gitlab:gitlab.cbitt.nask.pl";
      };
    };
  };
}
