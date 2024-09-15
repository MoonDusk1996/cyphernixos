{ pkgs, ... }:
with pkgs; let
  python-packages = python3.withPackages (python-packages:
    with python-packages; [
      pip
      pyserial
      cbor2
    ]);
in
{
  imports = [
    ./modules/programs
  ];

  home.packages = with pkgs; [
    # DEV
    gcc
    binutils
    rustup
    nodejs
    python-packages
    go

    # Tui
    btop
    neofetch
    zsh-powerlevel10k

    # Gui
    vlc
    pasystray
    rofi
    feh
    flameshot
    dolphin
    tor-browser-bundle-bin
    obs-studio
    pavucontrol
    emote
    neovide
    qbittorrent-nox
    electrum

    # UTILS
    xsel
  ];

  #KDE Connect
  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  # Instalar toolchain padrão
  home.activation = {
    installRustToolchain = ''
      ${pkgs.rustup}/bin/rustup default stable
      ${pkgs.rustup}/bin/rustup component add clippy
    '';
  };
}
