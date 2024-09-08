{ inputs, ... }: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    ./modules/desktops/i3/main.nix
    ./packages.nix
  ];

  # Home Manager needs a bit of information about you 
  home.username = "dusk";
  home.homeDirectory = "/home/dusk";

  # Environment
  home.sessionVariables = { EDITOR = "nvim"; };
  colorScheme = inputs.nix-colors.colorSchemes.standardized-dark;

  # Version
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
