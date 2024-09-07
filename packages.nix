{ pkgs, ... }:
let nerdFonts = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
in {
  imports = [ ./modules/programs/main.nix ];

  home.packages = with pkgs; [
    # DEV
    nixfmt-classic
    gcc
    binutils
    rustup
    nodejs

    # DEFAULT
    neovim
    neofetch
    vlc
    dolphin
    btop
    zsh-powerlevel10k
    tor-browser-bundle-bin
    pavucontrol

    # UTILS
    xsel
    obs-studio
    #kdeconnect

    # Fonts
    nerdFonts
  ];

  fonts.fontconfig = { enable = true; };
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Instalar toolchain padrão
  home.activation = {
    installRustToolchain = ''
      ${pkgs.rustup}/bin/rustup default stable
      ${pkgs.rustup}/bin/rustup component add clippy
      ${pkgs.rustup}/bin/rustup component add rustfmt
    '';
  };
}
