{ pkgs, config, ... }:

# Created By @icanwalkonwater
# Edited and ported to Nix by Th0rgal

let
  # Trasparent
  bg = "#00000000";
in
{
  services.polybar = with config.colorScheme.palette; {
    enable = true;

    package = pkgs.polybar.override {
      i3Support = true;
      alsaSupport = true;
    };

    script = "polybar -q -r top & polybar -q -r bottom &";

    config = {
      "global/wm" = {
        margin-bottom = 0;
        margin-top = 0;
      };

      #====================BARS====================#

      "bar/top" = {
        bottom = false;
        fixed-center = true;

        width = "100%";
        height = 19;
        scroll-up = "3wm-wsnext";
        scroll-down = "i3wm-wsprev";

        background = bg;
        foreground = "#${base06}";

        radius = 0;

        font-0 = "FiraCode Nerd Font:size=12;3";
        font-1 = "FiraCode Nerd Font:style=Bold:size=12;3";

        modules-left = "distro-icon dulS ddrT i3 dulT";
        modules-center = "title";
        modules-right = "durT tray ddlT durS date ";

        locale = "en_US.UTF-8";
      };

      # "bar/bottom" = {
      #   bottom = true;
      #   fixed-center = true;
      #
      #   width = "100%";
      #   height = 19;
      #
      #   offset-x = "1%";
      #
      #   background = bg;
      #   foreground = "#${base06}";
      #
      #   radius-top = 0;
      #
      #
      #   font-0 = "FiraCode Nerd Font:size=12;3";
      #   font-1 = "FiraCode Nerd Font:style=Bold:size=12;3";
      #
      #   modules-left = "powermenu ddlS";
      #
      #   modules-right = "ddrS cpu dulS ddrT memory dulT ";
      #
      #   locale = "en_US.UTF-8";
      # };

      "settings" = {
        # throttle-output = 5;
        # throttle-output-for = 10;
        # throttle-input-for = 30;
        #
        # screenchange-reload = true;
        #
        # compositing-background = "source";
        # compositing-foreground = "over";
        # compositing-overline = "over";
        # comppositing-underline = "over";
        # compositing-border = "over";

        # pseudo-transparency = "false";
      };

      #--------------------MODULES--------------------"

      "module/tray" = {
        type = "internal/tray";
        format-padding = 1;
        format-foreground = "#${base05}";
        format-background = "#${base03}";
        tray-foreground = "#${base05}";
        tray-background = "#${base03}";
        tray-size = 16;
        tray-spacing = 10;
      };

      "module/distro-icon" = {
        type = "custom/text";

        format = " ";
        format-background = "#${base01}";
        format-foreground = "#${base06}";
        format-padding = 1;
        label-font = 2;
      };

      "module/audio" = {
        type = "internal/alsa";

        format-volume-prefix = "  ";
        format-volume = "<label-volume>";
        format-volume-padding = 1;
        format-volume-foreground = "#${base05}";
        format-volume-prefix-foreground = "#${base0C}";
        format-volume-background = "#${base03}";
        label-volume = "%percentage%%";

        format-muted = "<label-muted>";
        format-muted-padding = 1;
        format-muted-foreground = "#${base01}";
        format-muted-background = "#${base03}";

        format-muted-prefix = "  ";
        format-muted-prefix-foreground = "#${base08}";
        format-muted-overline = bg;

        #label-muted = "0%";
      };

      "module/cpu" = {
        type = "internal/cpu";

        interval = "0.5";

        format = " <label>";
        format-foreground = "#${base06}";
        format-background = "#${base01}";
        format-padding = 1;

        label = "CPU %percentage%%";
      };

      "module/date" = {
        type = "internal/date";

        interval = "1.0";

        time = "%H:%M";
        time-alt = "%d/%m/%Y%";

        format = "<label>";
        format-padding = 1;
        format-foreground = "#${base06}";
        format-background = "#${base01}";

        label = "%time%";
      };

      "module/i3" = {
        type = "internal/i3";
        pin-workspaces = false;
        strip-wsnumbers = true;
        format = "<label-state> <label-mode>";
        format-background = "#${base03}";

        ws-icon-0 = "1; ";
        ws-icon-1 = "2; ";
        ws-icon-2 = "3; ";

        label-mode = "%mode%";
        label-mode-padding = 1;

        label-unfocused = "%icon%";
        label-unfocused-foreground = "#${base05}";
        label-unfocused-padding = 1;

        label-focused = "%index% %icon%";
        label-focused-font = 3;
        label-focused-foreground = "#${base0C}";
        label-focused-padding = 1;

        label-visible = "%icon%";
        label-visible-padding = 1;

        label-urgent = "%index%";
        label-urgent-foreground = "#${base08}";
        label-urgent-padding = 1;

        label-separator = "";
      };

      "module/title" = {
        type = "internal/xwindow";
        format = "<label>";
        format-foreground = "#${base07}";
        label = "%title%";
        label-maxlen = 50;
      };

      "module/memory" = {
        type = "internal/memory";

        interval = 3;

        format = " <label>";
        format-background = "#${base03}";
        format-foreground = "#${base01}";
        format-padding = 1;

        label = "RAM %percentage_used%%";
      };

      "module/powermenu" = {
        type = "custom/menu";
        expand-right = true;
        animation-step = 5000;

        format = "<label-toggle> <menu>";
        format-background = "#${base01}";
        format-padding = 1;

        label-open = " ";
        label-close = "";
        label-separator = "  ";

        menu-0-0 = " Suspend";
        menu-0-0-exec = "systemctl suspend";
        menu-0-1 = " Reboot";
        menu-0-1-exec = "v";
        menu-0-2 = " Shutdown";
        menu-0-2-exec = "systemctl poweroff";
      };

      #--------------------GAPS TRANSITIONS--------------------#

      "module/dulT" = {
        type = "custom/text";
        content = "";
        content-foreground = "#${base03}";
        content-background = bg;
      };

      "module/ddrT" = {
        type = "custom/text";
        content = "";
        content-foreground = "#${base03}";
        content-background = bg;
      };

      "module/ddlT" = {
        type = "custom/text";
        content = "";
        content-foreground = "#${base03}";
        content-background = bg;
      };

      "module/durT" = {
        type = "custom/text";
        content = "";
        content-foreground = "#${base03}";
        content-background = bg;
      };

      "module/ddlP" = {
        type = "custom/text";
        content = "";
        content-foreground = "#${base03}";
        content-background = bg;
      };

      "module/durP" = {
        type = "custom/text";
        content = "";
        content-foreground = "#${base03}";
        content-background = bg;
      };

      "module/dulP" = {
        type = "custom/text";
        content = "";
        content-foreground = "#${base03}";
        content-background = bg;
      };

      "module/ddrP" = {
        type = "custom/text";
        content = "";
        content-foreground = "#${base03}";
        content-background = bg;
      };

      "module/dulS" = {
        type = "custom/text";
        content = "";
        content-foreground = "#${base01}";
        content-background = bg;
      };

      "module/ddlS" = {
        type = "custom/text";
        content = "";
        content-foreground = "#${base01}";
        content-background = bg;
      };

      "module/durS" = {
        type = "custom/text";
        content = "";
        content-foreground = "#${base01}";
        content-background = bg;
      };

      "module/ddrS" = {
        type = "custom/text";
        content = "";
        content-foreground = "#${base01}";
        content-background = bg;
      };
    };
  };
}

