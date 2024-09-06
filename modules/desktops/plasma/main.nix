{ lib, pkgs, ... }:
{
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = rec {
    modifier = "Mod4";
      bars = [ ];

      window.border = 1;
      window.titlebar = false;

      gaps = {
        inner = 7;
        outer = 3;
      };

      keybindings = lib.mkOptionDefault {
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status";
        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status";
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
        "${modifier}+q" = "kill";
        "${modifier}+Shift+r" = "restart";
        "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show-icons -show drun";
        "${modifier}+b" = "exec ${pkgs.firefox}/bin/firefox";
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
          command = "${pkgs.feh}/bin/feh --bg-scale ~/background.jpg";
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
