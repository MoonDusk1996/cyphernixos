{ inputs, ... }: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
  ];

  # colorScheme = nix-colors.colorSchemes.gruvbox-material-dark-soft;
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  # colorScheme = nix-colors.colorSchemes.atelier-estuary;
}
