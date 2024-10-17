{
  networking = {
    hostName = "wired"; # Define your hostname.
    networkmanager.enable = true;
    useDHCP = false;

    interfaces.enp3s0 = {
      useDHCP = false;
      ipv4.addresses = [
        {
          address = "192.168.1.10";
          prefixLength = 24;
        }
      ];
      # ipv6.addresses = [
      #   {
      #     address = "fe80::10";
      #     prefixLength = 64;
      #   }
      # ];
    };
    defaultGateway = {
      address = "192.168.1.1";
      interface = "enp3s0";
    };
    # defaultGateway6 = {
    #   address = "fe80::1";
    #   interface = "enp3s0"; # Substitua por sua interface real
    # };
    nameservers = [ "127.0.0.1" "8.8.8.8" ];

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
