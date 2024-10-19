{
  networking = {
    hostName = "wired"; # Define your hostname.
    firewall = rec {
      enable = false;
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
        {
          from = 53;
          to = 53;
        }
      ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };
}
