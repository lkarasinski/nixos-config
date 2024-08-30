{ pkgs, pkgsUnstable,  ... }: 
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
    spotify
    thunderbird

    nodejs
    bun
    git
    pkgsUnstable.nodePackages.pnpm
    nodePackages."@antfu/ni"
    nodePackages.typescript
    typescript
    biome
    tailwindcss

    fzf
    lazygit
    ripgrep
    ffmpeg
    wl-clipboard
    unzip
    wget
    zoxide
    tmuxp
    fastfetch
    any-nix-shell

    # Work
    jitsi-meet-electron
    openfortivpn
    rocketchat-desktop
  ]);
}
