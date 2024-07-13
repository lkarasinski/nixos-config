{ pkgs, ... }: 
{
  nixpkgs.config.allowUnfree = true;
  home.packages = (with pkgs; [
    alacritty
    chromium
    obs-studio
    vesktop
    obsidian
    firefox
    google-chrome

    nodejs
    git

    fzf
    lazygit
    ripgrep
    ffmpeg
    wl-clipboard
    unzip
    wget
    zoxide
  ]);
}
