{ pkgs, ... }: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Desktop apps
    alacritty
    chromium
    obs-studio
    discord
    obsidian
    firefox
    google-chrome

    # Programming 
    nodejs
    git

    # CLI
    fastfetch
    zoxide
    ffmpeg
    lazygit

    # Tools
    vim
    neovim
    tmux

    # Other
    home-manager
  ];

  fonts.packages = with pkgs; [ (nerdfonts.override { fonts = [ "FiraCode" ]; }) ];
}
