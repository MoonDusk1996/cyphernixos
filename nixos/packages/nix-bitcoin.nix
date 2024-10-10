{
  nix-bitcoin = {
    generateSecrets = true;
    nodeinfo.enable = true;
    operator = {
      enable = true;
      name = "dusk";
    };
  };
}
