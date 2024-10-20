{ pkgs, ... }: {
  imports = [
    ../../hardware-configuration.nix
  ];
  networking = {
    hostName = "dandelion";
    wireless = {
      enable = true;
      networks = {
        "ZTE_EC5E" = {
          psk = "CCyGdhPPdt";
        };
      };
    };
  };

  hardware = {
    graphics = {
      enable = true;
    };
    opengl = {
      enable = true;
    };
  };

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1"; # Hint electron apps to use wayland
      WLR_NO_HARDWARE_CURSORS = "1"; # Fix cursor rendering issue on wlr nvidia.

      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";

      GBM_BACKEND = "intel";
      __GLX_VENDOR_LIBRARY_NAME = "intel";
      LIBVA_DRIVER_NAME = "intel";
      __GL_GSYNC_ALLOWED = "1";
      __GL_VRR_ALLOWED = "0";
      WLR_DRM_NO_ATOMIC = "1";

      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "qt5ct";

      GDK_SCALE = "2";

      ELECTRON_OZONE_PLATFORM_HINT = "auto";

    };
  };
  programs = {
    zsh.enable = true;
    dconf.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
  services.xserver.videoDrivers = [ "intel" ];
}
