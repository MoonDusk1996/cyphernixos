{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./services.nix
    ./packages
  ];
  boot.kernelPackages = pkgs.linuxPackages_zen;
  nixpkgs.config.allowUnfree = true;
  virtualisation.docker.enable = true;

  # Enable Flakes
  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };

    settings.auto-optimise-store = true;
  };

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    systemd-boot.configurationLimit = 7;
  };

  # Networking
  networking = {
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    hostName = "lumia"; # Define your hostname.
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        } # KDE Connect
      ];
    };
  };

  # Time zone.
  time.timeZone = "America/Manaus";
  i18n.defaultLocale = "pt_BR.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  console.keyMap = "br-abnt2";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      dusk = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" "audio" "docker" ];
      };
    };
  };

  # Version
  system.stateVersion = "24.05"; # Did you read the comment?
}
