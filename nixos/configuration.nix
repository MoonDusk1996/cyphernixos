{ pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./packages
    ./services.nix
    ./disks.nix
    ./zone.nix
    ./networking.nix
  ];

  #Kernel
  boot.kernelPackages = pkgs.linuxPackages_zen;

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
    defaultUserShell = pkgs.zsh;
    users = {
      dusk = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" ];
      };
    };
  };

  # Version
  system.stateVersion = "24.05"; # Did you read the comment?
}
