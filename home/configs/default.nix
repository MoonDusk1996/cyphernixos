{ pkgs, ... }: {
  imports = [
    ./theme
    ./alacritty.nix
    # ./chromium.nix
    # ./cursor.nix
    ./firefox.nix
    ./git.nix
    ./hyprland.nix
    ./i3wm.nix
    ./kde-connect.nix
    ./nixvim.nix
    ./picom.nix
    ./polybar.nix
    ./ranger.nix
    ./redshift.nix
    ./zsh.nix
  ];
  home.packages = with pkgs; [
    # rustup
    # Tui
    btop
    neofetch
    zsh-powerlevel10k
    ncdu

    # Gui
    vlc
    volctl
    rofi
    feh
    flameshot
    obs-studio
    pavucontrol
    emote
    electrum
    filelight
    ark
    pcmanfm
  ];

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  # # Instalar toolchain padrão
  # home.activation = {
  #   installRustToolchain = ''
  #     ${pkgs.rustup}/bin/rustup default stable
  #     ${pkgs.rustup}/bin/rustup component add clippy
  #   '';
  # };
}
