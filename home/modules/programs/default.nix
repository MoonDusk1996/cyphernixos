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
    ./git.nix
    ./zsh.nix
    ./firefox.nix
    # ./chromium.nix
    ./alacritty.nix
    ./ranger.nix
    ./nixvim.nix
  ];
  home.packages = with pkgs; [
    # DEV
    gcc
    binutils
    rustup
    node2nix
    nodejs
    yarn
    pnpm
    # python-packages
    # go

    # Tui
    btop
    neofetch
    zsh-powerlevel10k
    whois
    ncdu

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
    electrum
    monero-gui
    filelight
    ark

    # UTILS
    xsel
    xclip
    time
    kdeconnect
  ];

  # Instalar toolchain padrão
  home.activation = {
    installRustToolchain = ''
      ${pkgs.rustup}/bin/rustup default stable
      ${pkgs.rustup}/bin/rustup component add clippy
    '';
  };
}
