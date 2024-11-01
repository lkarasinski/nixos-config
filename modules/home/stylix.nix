{pkgs, ...}: {
  stylix.image = ./style/wallpaper.png;
  stylix.enable = true;

  stylix.polarity = "dark";
  stylix.base16Scheme = ./style/kanagawa-dragon.yml;

  stylix.fonts = {
    sizes = {
      terminal = 14;
    };

    sansSerif = {
      name = "Inter";
      package = pkgs.inter;
    };

    monospace = {
      name = "CaskaydiaCove Nerd Font Mono";
      package = pkgs.nerdfonts.override {fonts = ["CascadiaCode"];};
    };
  };
}
