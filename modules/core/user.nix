{pkgs, ...}: {
  programs.fish.enable = true;
  users = {
    users.lkarasinski = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
        "input"
      ];
    };
    defaultUserShell = pkgs.fish;
  };
}
