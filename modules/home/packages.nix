{ inputs, pkgs, pkgsUnstable,  ... }: 
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
    inputs.neovim-flake.packages.${pkgs.system}.default

    nodejs
    bun
    git
    pkgsUnstable.nodePackages.pnpm
    pkgsUnstable.nodePackages.yarn
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
	fd
	bat
	sqlite
	grc
	devenv
	btop

    # Work
    jitsi-meet-electron
    openfortivpn
    rocketchat-desktop
  ]);
}
