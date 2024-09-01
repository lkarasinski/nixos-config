{ pkgs, ... }: {
  programs.fish.enable = true;
  users = {
    users.lkarasinski = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
    };
    defaultUserShell = pkgs.fish;
  };
}
