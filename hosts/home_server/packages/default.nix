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

  imports = [
    ./nix-bitcoin.nix
    ./nvidia.nix
    ./fonts.nix
    ./virtualization.nix
  ];
}
