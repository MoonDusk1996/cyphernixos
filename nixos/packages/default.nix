{ pkgs, ... }: {
  imports = [
    ./nostr-rs-relay.nix
    ./nix-bitcoin.nix
    ./nvidia.nix
  ];
  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
    nostr-rs-relay
    docker-compose
    tor
  ];
}
