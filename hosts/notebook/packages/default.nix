{ pkgs, ... }: {
  environment.systemPackages = [
    # ... other packages
    pkgs.kitty # required for the default Hyprland config
  ];

  # Optional, hint Electron apps to use Wayland:
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs = {
    zsh.enable = true;
    dconf.enable = true;
    hyprland = {
      # Install the packages from nixpkgs
      enable = true;
      # Whether to enable XWayland
      xwayland.enable = true;
    };
  };

  services.xserver.videoDrivers = [ "intel" ];

  hardware = {
    graphics = {
      enable = true;
    };
    opengl = {
      enable = true;
    };
  };

  services.gvfs.enable = true;
}
