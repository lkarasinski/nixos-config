{
  programs.git = {
    enable = true;
    userName = "Łukasz Karasiński";
    userEmail = "lukasz@karasin.ski";
    ignores = ["shell.nix"];

    extraConfig = {
      rerere.enabled = true;
    };

    includes = [
      {
        # Work config for gitlab directories
        condition = "gitdir:~/workspace/gitlab.cbitt.nask.pl/";
        contents = {
          user = {
            email = "lukasz.karasinski@nask.pl";
          };
        };
      }
      {
        # Personal config for github directories
        condition = "gitdir:~/workspace/github.com/";
        contents = {
          user = {
            email = "lukasz@karasin.ski";
          };
        };
      }
    ];
  };
}
