{ inputs, ... }: {
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    ../hosts/i3
    ./packages.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Colorscheme
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-material-dark-soft;

  # Home settings
  home = {
    # Home Manager needs a bit of information about you
    username = "dusk";
    homeDirectory = "/home/dusk";

    # Environment
    sessionVariables = { EDITOR = "nvim"; };

    # Version
    stateVersion = "24.05"; # Please read the comment before changing.
  };
}
