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
