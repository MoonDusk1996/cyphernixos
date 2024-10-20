{
  imports = [
    ../../hardware-configuration.nix
  ];

  networking = {
    networkmanager.enable = true;
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

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs = {
    zsh.enable = true;
    dconf.enable = true;
    hyprland = {
      enable = true;
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
