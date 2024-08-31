{ inputs, ... }:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./modules/desktops/i3.nix
    ./modules/programs/alacritty.nix
    ./modules/programs/chromium.nix
    ./modules/programs/cursor.nix
    ./modules/programs/firefox.nix
    ./modules/programs/git.nix
    ./modules/programs/picom.nix
    ./modules/programs/polybar.nix
    ./modules/programs/zsh.nix
    ./config.nix
    ./packages.nix
  ];

  # Home Manager needs a bit of information about you 
  home.username = "dusk";
  home.homeDirectory = "/home/dusk";

  # Variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Version
  home.stateVersion = "24.05"; # Please read the comment before changing.
}

