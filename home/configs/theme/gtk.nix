{ pkgs, ... }: {
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;
    # theme = {
    #   name = "Breeze-Dark";
    #   package = pkgs.libsForQt5.breeze-gtk;
    # };

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };
    # iconTheme = {
    #   name = "Tango";
    #   package = pkgs.tango-icon-theme;
    # };

    iconTheme = {
      package = pkgs.gnome.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };

    # gtk3 = {
    #   extraConfig.gtk-application-prefer-dark-theme = true;
    # };
    # gtk4 = {
    #   extraConfig.gtk-application-prefer-dark-theme = true;
    # };
  };
  # GTK4 Setup
  # dconf.settings = {
  #   "org/gnome/desktop/interface" = {
  #     color-scheme = "prefer-dark";
  #   };
  # };
}
