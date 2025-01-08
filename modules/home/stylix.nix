{pkgs, ...}: {
  stylix.image = ./style/wallpaper.png;
  stylix.enable = true;

  stylix.polarity = "dark";
  stylix.base16Scheme = ./style/kanagawa-dragon.yml;

  stylix.cursor = {
    name = "Capitaine";
    size = 32;
    package = pkgs.capitaine-cursors;
  };

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
      package = pkgs.nerd-fonts.caskaydia-cove;
    };
  };
}
