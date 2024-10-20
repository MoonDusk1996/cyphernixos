{ config, ... }: {
  services.picom = with config.colorScheme.palette; {
    enable = true;
    shadow = true;
    backend = "glx";
    # inactiveOpacity = 0.99;
    # activeOpacity = 1;
    vSync = true;
    # opacityRules = [
    #   "100:name *?= 'vlc'"
    #   "100:class_g *= 'firefox'"
    #   "100:class_g *= 'Rofi'"
    # ];

    # fade = true;

    # wintypes = {
    #   menu = {
    #     shadow = false;
    #     opacity = 1;
    #     blur-background = false;
    #   };
    #   popup_menu = {
    #     opacity = 0.8;
    #     shadow = false;
    #   };
    #   dropdown_menu = {
    #     opacity = 0.8;
    #     shadow = false;
    #   };
    # };
    settings = {
      unredir-if-possible = false;
      corner-radius = 3;
      round-borders = 1;
      shadow-color = "#${base00}";
      rounded-corners-exclude = [
        "class_g = 'Polybar'"
      ];
      blur = {
        method = "gaussian";
        size = 15;
        deviation = 7;
      };
    };
  };
}
