{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = (
    with pkgs; [
      ghostty
      alacritty
      chromium
      obs-studio
      vlc
      vesktop
      obsidian
      firefox
      google-chrome
      spotify
      bitwarden-desktop
      calibre
      inputs.neovim-flake.packages.${pkgs.system}.default
      protonup-qt
      wootility
      wooting-udev-rules
      code-cursor
      kdePackages.ghostwriter

      nodejs_23
      bun
      git
      nodePackages.pnpm
      nodePackages.yarn
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
      eza
      tmuxp
      fastfetch
      any-nix-shell
      fd
      bat
      sqlite
      grc
      devenv
      direnv
      btop
      gh
      mullvad-vpn

      # Work
      # broken for some reason
      # jitsi-meet-electron
      openfortivpn
      rocketchat-desktop
      element-desktop
    ]
  );
}
