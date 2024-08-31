{ inputs, ... }:
{
  # Unshow warning
  home.enableNixpkgsReleaseCheck = false;

  # Enable unfree packages
  allowUnfree = true;

  # ColorScheme
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-material-dark-hard;
}

