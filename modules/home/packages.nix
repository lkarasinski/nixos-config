{
  inputs,
  pkgs,
  pkgsUnstable,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = (
    with pkgs;
    [
      alacritty
      chromium
      obs-studio
      vesktop
      obsidian
      firefox
      google-chrome
      spotify
      bitwarden-desktop
      inputs.neovim-flake.packages.${pkgs.system}.default

      nodejs
      bun
      git
      pkgsUnstable.nodePackages.pnpm
      pkgsUnstable.nodePackages.yarn
      pkgsUnstable.nodePackages."@antfu/ni"
      pkgsUnstable.nodePackages.typescript
      pkgsUnstable.typescript
      pkgsUnstable.biome
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
      pkgsUnstable.devenv
      direnv
      btop
      gh

      # Work
      jitsi-meet-electron
      openfortivpn
      rocketchat-desktop
    ]
  );
}
