{ pkgs, ... }: {
  imports = [
    ./packages
    ./services
    ../../hardware-configuration.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    initrd.luks = {
      devices = {
        "luks-c85cfb8a-6b23-4c0b-8250-714571c78631" = {
          device = "/dev/disk/by-uuid/c85cfb8a-6b23-4c0b-8250-714571c78631";
        };
        "ciberia" = {
          device = "/dev/disk/by-uuid/3d605ccd-16d4-4b1f-ad18-11d71cbd9c3e";
        };
        "flame" = {
          device = "/dev/disk/by-uuid/d0e627bb-98c3-439b-adf0-d114ca98befa";
        };
      };
    };
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 7;
    };
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  fileSystems = {
    "/mnt/ciberia" = {
      device = "/dev/disk/by-uuid/fb7f61ed-7d32-46d8-a49c-3e827a25af93";
      fsType = "ext4";
    };
    "/mnt/flame" = {
      device = "/dev/disk/by-uuid/7fb8b134-5992-42e1-b136-7d1088fd10fd";
      fsType = "ext4";
    };
  };

  networking = {
    hostName = "wired"; # Define your hostname.
    firewall = rec {
      enable = false;
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
        {
          from = 53;
          to = 53;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
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

  #sleep config
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users = {
      dusk = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
      };
    };
  };
  # zsh
  environment.shells = with pkgs; [ zsh ];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "breeze";
  };
  programs.dconf.enable = true;

  # Udev jade rules
  services.udev.extraRules = ''
    KERNEL=="ttyUSB*", SUBSYSTEMS=="usb", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", MODE="0660", GROUP="plugdev", TAG+="uaccess", TAG+="udev-acl", SYMLINK+="jade%n"
    KERNEL=="ttyACM*", SUBSYSTEMS=="usb", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="55d4", MODE="0660", GROUP="plugdev", TAG+="uaccess", TAG+="udev-acl", SYMLINK+="jade%n"
  '';

  # Version
  system.stateVersion = "24.05"; # Did you read the comment?
}
