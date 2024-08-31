{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 14.0;
        normal = {
          family = "CaskaydiaCove Nerd Font Mono";
        };
      };
	  colors = {
        primary = {
          background = "#181616";
          foreground = "#c5c9c5";
        };
        normal = {
          black =   "#0d0c0c";
          red =     "#c4746e";
          green =   "#8a9a7b";
          yellow =  "#c4b28a";
          blue =    "#8ba4b0";
          magenta = "#a292a3";
          cyan =    "#8ea4a2";
          white =   "#C8C093";
        };
        bright = {
          black =   "#a6a69c";
          red =     "#E46876";
          green =   "#87a987";
          yellow =  "#E6C384";
          blue =    "#7FB4CA";
          magenta = "#938AA9";
          cyan =    "#7AA89F";
          white =   "#c5c9c5";
        };
      };
    };
  };
}
