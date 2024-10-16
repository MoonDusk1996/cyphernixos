{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nostr-rs-relay
    gcc
    binutils
    whois
    xsel
    xclip
    udisks2
    xdg-desktop-portal-kde
    time
  ];

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "breeze";
  };
  programs.dconf.enable = true;
  xdg.portal = {
    lxqt.enable = true;
    xdgOpenUsePortal = true;
  };
  imports = [
    ./nix-bitcoin.nix
    ./nvidia.nix
    ./fonts.nix
  ];
}
