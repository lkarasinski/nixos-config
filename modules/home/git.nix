{
  programs.git = {
    enable = true;
    userName = "Łukasz Karasiński";
    userEmail = "lukasz@karasin.ski";
    ignores = [ "shell.nix" ];

    extraConfig = {
      rerere.enabled = true;
    };
  };
}
