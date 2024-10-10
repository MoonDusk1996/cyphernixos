{ config, ... }: {
  services.picom = with config.colorScheme.palette; {
    enable = true;
    shadow = true;
    backend = "glx";
    inactiveOpacity = 0.9;
    activeOpacity = 1;
    vSync = true;
    # opacityRules = [
    #   "100:name *?= 'vlc'"
    #   "100:class_g *= 'firefox'"
    #   "100:class_g *= 'Rofi'"
    #   "100:class_g *= 'Chromium-browser'"
    # ];

    fade = true;

    wintypes = {
      menu = {
        shadow = false;
        opacity = 1;
        blur-background = false;
      };
      popup_menu = {
        opacity = 0.8;
        shadow = false;
      };
      dropdown_menu = {
        opacity = 0.8;
        shadow = false;
      };
    };
    settings = {
      unredir-if-possible = false;
      corner-radius = 7;
      round-borders = 3;
      shadow-color = "#${base00}";
      blur = {
        method = "gaussian";
        size = 15;
        deviation = 7;
      };
    };
  };
}
