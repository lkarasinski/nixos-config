{...}: {
  services.xserver = {
    enable = true;

    # Configure keymap in X11
    xkb = {
      layout = "pl";
      variant = "";
    };
  };
}
