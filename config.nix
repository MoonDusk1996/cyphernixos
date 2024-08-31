{ inputs, ... }:
{
  # Unshow warning
  home.enableNixpkgsReleaseCheck = false;

  # ColorScheme
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-material-dark-hard;
}

