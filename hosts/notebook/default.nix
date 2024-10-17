{ pkgs, ... }: {
  programs.hyprland = {
    # Install the packages from nixpkgs
    enable = true;
    # Whether to enable XWayland
    xwayland.enable = true;
  };
  networking.hostName = "dandelion";
  services.gvfs.enable = true;
  networking.wireless.networks = {
    "ZTE_EC5E" = {
      psk = "CCyGdhPPdt";
    };
  };
}
