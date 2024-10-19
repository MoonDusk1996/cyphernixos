{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nostr-rs-relay
    gcc
    binutils
    whois
    xsel
    xclip
    udisks2
    time
  ];

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "breeze";
  };
  programs.dconf.enable = true;
   imports = [
    ./nix-bitcoin.nix
    ./nvidia.nix
    ./fonts.nix
    ./disks.nix
    ./networking.nix
    ./virtualization.nix
  ];
}
