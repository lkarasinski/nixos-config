{ pkgs, ... }: {
  programs.zsh.enable = true;
  users = {
    users.lkarasinski = {
      isNormalUser = true;
      extraGroups = [ "networkmanager" "wheel" ];
    };
    defaultUserShell = pkgs.zsh;
  };
}
