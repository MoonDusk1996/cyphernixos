{ config, ... }: {
  services.picom = with config.colorScheme.palette; {
    shadow = true;

    enable = true;
    backend = "glx";
    inactiveOpacity = 0.8;
    activeOpacity = 0.9;
    vSync = true;
    opacityRules = [
      "100:name *?= 'vlc'"
      "100:class_g *= 'firefox'"
      "100:class_g *= 'Rofi'"
      "100:class_g *= 'Chromium-browser'"
    ];

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
      corner-radius = 7;
      round-borders = 3;
      shadow-color = "#${base00}";
      blur = {
        method = "gaussian";
        size = 30;
        deviation = 30;
      };
    };
  };
}
