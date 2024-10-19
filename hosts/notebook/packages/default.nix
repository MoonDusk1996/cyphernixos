{ pkgs
, inputs
, ...
}: {
  programs = {
    zsh.enable = true;
    dconf.enable = true;
    hyprland = {
      # Install the packages from nixpkgs
      enable = true;
      # Whether to enable XWayland
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
  };
  services.gvfs.enable = true;
}
