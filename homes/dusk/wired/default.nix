{ pkgs, ... }: {
  imports = [
    ./i3wm.nix
    ./picom.nix
    ./polybar.nix
    ./redshift.nix
    ./virt-manager.nix
  ];

  home.packages = with pkgs; [
    volctl
    feh
    flameshot
  ];
}
