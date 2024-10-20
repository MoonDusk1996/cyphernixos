{ pkgs, ... }: {
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

  hardware = {
    graphics = {
      enable = true;
    };
    opengl = {
      enable = true;
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    whois
    xsel
    xclip
    udisks2
    time
  ];
  programs = {
    zsh.enable = true;
    dconf.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
  services.xserver.videoDrivers = [ "intel" ];
  services.gvfs.enable = true;
}
