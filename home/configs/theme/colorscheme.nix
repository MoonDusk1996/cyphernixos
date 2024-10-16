{ nix-colors, ... }: {
  imports = [
    nix-colors.homeManagerModules.default
  ];

  # colorScheme = nix-colors.colorSchemes.gruvbox-material-dark-soft;
  colorScheme = nix-colors.colorSchemes.catppuccin-mocha;
  # colorScheme = nix-colors.colorSchemes.atelier-estuary;
}
