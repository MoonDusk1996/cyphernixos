{ pkgs, ... }: {
  imports = [
    ./alacritty.nix
    # ./chromium.nix
    ./colorscheme.nix
    ./firefox.nix
    ./git.nix
    ./gtk.nix
    ./kde-connect.nix
    # ./kdeglobals.nix
    ./nixvim.nix
    ./ranger.nix
    ./zsh.nix
  ];
  home.packages = with pkgs; [
    # Dev
    # rustup

    # Tui
    btop
    neofetch
    zsh-powerlevel10k
    ncdu

    # Gui
    vlc
    rofi
    obs-studio
    pavucontrol
    emote
    electrum
    filelight
    ark
    pcmanfm
  ];

  # # Instalar toolchain padrão
  # home.activation = {
  #   installRustToolchain = ''
  #     ${pkgs.rustup}/bin/rustup default stable
  #     ${pkgs.rustup}/bin/rustup component add clippy
  #   '';
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home settings
  home = {
    # Home Manager needs a bit of information about you
    username = "dusk";
    homeDirectory = "/home/dusk";

    # Environment
    sessionVariables = {
      EDITOR = "nvim";
      BROWSER = "firefox";
      TERMINAL = "alacritty";
    };

    # Version
    stateVersion = "24.05"; # Please read the comment before changing.
  };
}
