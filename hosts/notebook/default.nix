{ pkgs, ... }: {
  imports = [
    ./packages
    ../../hardware-configuration.nix
  ];

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "breeze";
  };

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

  console.keyMap = "br-abnt";

  nix = {
    # Enable Flakes
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    # Garbage collectors
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
  };

  #sleep config
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    systemd-boot.configurationLimit = 7;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      dusk = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" ];
      };
    };
  };

  # zsh
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;

  # Udev jade rules
  services.udev.extraRules = ''
    KERNEL=="ttyUSB*", SUBSYSTEMS=="usb", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", MODE="0660", GROUP="plugdev", TAG+="uaccess", TAG+="udev-acl", SYMLINK+="jade%n"
    KERNEL=="ttyACM*", SUBSYSTEMS=="usb", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="55d4", MODE="0660", GROUP="plugdev", TAG+="uaccess", TAG+="udev-acl", SYMLINK+="jade%n"
  '';

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

  # Version
  system.stateVersion = "24.05"; # Did you read the comment?
}
