{
  imports = [
    ../hosts/home_server
    ./modules/colorscheme.nix
    ./modules/programs
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

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
