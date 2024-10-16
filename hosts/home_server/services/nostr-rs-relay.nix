{ pkgs, ... }: {
  systemd.services.nostr-relay = {
    wantedBy = [ "multi-user.target" ]; # Garante que o serviço é iniciado no boot
    enable = true;
    description = "Nostr RS Relay Service";
    serviceConfig.ExecStart = "${pkgs.nostr-rs-relay}/bin/nostr-rs-relay --config /mnt/ciberia/cypher_hub/nostr-rs-relay/config.toml";
    serviceConfig.Restart = "always";
  };
}
