{
  services.picom =
    {
      enable = true;
      #backend = "glx";
      inactiveOpacity = 0.7;
      activeOpacity = 0.9;
      vSync = true;
      opacityRules = [
        "100:name *?= 'vlc'"
        "100:class_g *= 'firefox'"
        "100:class_g *= 'Rofi'"
        "100:class_g *= 'Chromium'"
      ];

      #fade = true;
      #fadeDelta = 10;

      settings = {
        corner-radius = 7;
        round-borders = 3;

        # animations = true;
        # animation-stiffness = 180.0;
        # animation-dampening = 28.0;
        # animation-clamping = true;
        # animation-mass = 1;
        # animation-for-open-window = "zoom";
        # animation-for-menu-window = "slide-down";
        # animation-for-transient-window = "slide-down";
        # animation-for-workspace-switch-in = "slide-down";
        # animation-for-workspace-switch-out = "slide-up";

        # When windows get moved or resized it transitions window position 
        # transition = true;
        # transition-offset = 10;

        #blur = {
        #  method = "gaussian";
        #  size = 7;
        #  deviation = 3;
        #};
      };
    };
}
