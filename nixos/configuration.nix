# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports = [
    ./modules/nvidia.nix
    ./modules/virtualisation.nix
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # Flakes

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "lumia"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

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

  # Keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  console.keyMap = "br-abnt2";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dusk = {
    isNormalUser = true;
    description = "dusk";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [ ];
  };
  services.getty.autologinUser = "dusk"; # Enable automatic login for the user.

  # X server, i3 and slick-greeter
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    displayManager.lightdm = {
      background = "/etc/lightdm/.background";
      # greeters.slick = {
      #   enable = true;
      # };
    };
  };
  services.displayManager.defaultSession = "none+i3";

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [{
      from = 1714;
      to = 1764;
    } # KDE Connect
      ];
    allowedUDPPortRanges = [{
      from = 1714;
      to = 1764;
    } # KDE Connect
      ];
  };
  # Zshell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Audio
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Version
  system.stateVersion = "24.05"; # Did you read the comment?
}
