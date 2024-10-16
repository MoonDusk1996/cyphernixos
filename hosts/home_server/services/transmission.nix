{
  services.transmission = {
    enable = true; #Enable transmission daemon
    openRPCPort = true; #Open firewall for RPC
    settings = {
      rpc-bind-address = "0.0.0.0"; #Bind to own IP
      rpc-whitelist-enabled = false;
      download-dir = "/mnt/ciberia/cypher_hub/torrents/downloads";
    };
  };
}
