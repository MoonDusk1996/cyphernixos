{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # DEV
    nixfmt
    gcc
    binutils
    rustup
    nodejs

    # BLOCKCHAIN

    # DEFAULT
    neovim
    neofetch
    vlc
    dolphin
    btop
    zsh-powerlevel10k
    pavucontrol

    # UTILS
    xsel
    obs-studio
    #kdeconnect

    # Fonts
    meslo-lgs-nf
    #nerdfonts
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
