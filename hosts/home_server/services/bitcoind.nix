{
  services.bitcoind = {
    enable = true;
    dataDir = "/mnt/ciberia/cypher_hub/bitcoind";
    txindex = false;
  };
}
