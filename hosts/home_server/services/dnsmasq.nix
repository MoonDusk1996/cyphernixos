{
  services.dnsmasq = {
    enable = true;
    settings = {
      server = [
        "8.8.8.8"
        "1.1.1.1"
      ];
      address = [
        "/wired/192.168.1.10"
        "/router/192.168.1.1"
      ];
    };
    extraConfig = ''
      local=/local/
      domain=local
      no-dhcp-interface=
      expand-hosts
    '';
  };
}
