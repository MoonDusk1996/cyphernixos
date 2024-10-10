{ config
, lib
, pkgs
, ...
}: {
  xsession.windowManager.i3 = with config.colorScheme.palette; {
    enable = true;
    package = pkgs.i3-gaps;
    extraConfig = ''
      workspace 1 output HDMI-0
      for_window [class="feh"] floating enable, move position center, resize set 1280 960
      for_window [class="vlc"] floating disable, fullscreen enable
      for_window [window_role="pop-up"] floating enable, move position center
    '';
    config = rec {
      colors.focused.background = "#${base00}";
      colors.focused.border = "#${base02}";
      colors.focused.childBorder = "#${base02}";
      colors.focused.indicator = "#${base03}";
      colors.focused.text = "#${base06}";
      modifier = "Mod4";
      bars = [ ];

      window.border = 1;
      window.titlebar = false;
      gaps = {
        inner = 7;
        outer = 0;
        smartGaps = true;
      };
      keybindings = lib.mkOptionDefault {
        "XF86AudioRaiseVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_SINK@ 4%+ && $refresh_i3status";
        "XF86AudioLowerVolume" = "exec --no-startup-id wpctl set-volume @DEFAULT_SINK@ 4%- && $refresh_i3status";
        "XF86AudioMute" = "exec --no-startup-id wpctl set-mute @DEFAULT_SINK@ toggle && $refresh_i3status";
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+q" = "kill";
        "${modifier}+Shift+r" = "restart";
        "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show-icons -show drun";
        "${modifier}+b" = "exec ${pkgs.chromium}/bin/chromium";
        "Print" = "exec ${pkgs.flameshot}/bin/flameshot gui";
        "${modifier}+Shift+x" = "exec systemctl suspend";
      };

      startup = [
        {
          command = "exec i3-msg workspace 1";
          always = true;
          notification = false;
        }
        {
          command = "exec pasystray";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.feh}/bin/feh --bg-fill ~/.background";
          always = true;
          notification = false;
        }
        {
          command = "systemctl --user restart polybar.service";
          always = true;
          notification = false;
        }
      ];
    };
  };
}
