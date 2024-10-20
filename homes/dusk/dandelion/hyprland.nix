{ inputs
, pkgs
, ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "alacritty";
      "$fileManager" = "pcmanfm";

      decoration = {
        rounding = "10";
        shadow_offset = "0 5";
        "col.shadow" = "rgba(00000099)";
        drop_shadow = false;
        blur = {
          enabled = false;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      misc = {
        vfr = true;
      };
      monitor = "Virtual-1, 1920x1080@60, 0x0, 1";
      gestures = {
        workspace_swipe = true;
        workspace_swipe_touch = true;
      };
      bind =
        [
          "$mod, RETURN, exec, $terminal"
          "$mod, Q, killactive"
          "$mod, F, exec, firefox"
          "$mod, M, exit"
          ", Print, exec, grimblast copy area"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList
            (
              i:
              let
                ws = i + 1;
              in
              [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
    };
  };
}
