{
  services.tor = {
    enable = true;
    enableGeoIP = false;
    relay.onionServices = {
      nostr-rs-relay = {
        version = 3;
        map = [
          {
            port = 80;
            target = {
              addr = "127.0.0.1";
              port = 8080;
            };
          }
        ];
      };
      calibre-web = {
        version = 3;
        map = [
          {
            port = 80;
            target = {
              addr = "127.0.0.1";
              port = 8083;
            };
          }
        ];
      };
      # nostr-server = {
      #   version = 3;
      #   map = [
      #     {
      #       port = 80;
      #       target = {
      #         addr = "127.0.0.1";
      #         port = 3000;
      #       };
      #     }
      # ];
      # };
    };
  };
}
