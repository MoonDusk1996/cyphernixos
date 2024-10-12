{
  services = {
    bitcoind = {
      enable = true;
      dataDir = "/mnt/ciberia/cypher_hub/bitcoind";
      txindex = false;
    };
    electrs = {
      enable = true;
      dataDir = "/mnt/ciberia/cypher_hub/electrs";
    };
    transmission = {
      enable = true; #Enable transmission daemon
      openRPCPort = true; #Open firewall for RPC
      settings = {
        rpc-bind-address = "0.0.0.0"; #Bind to own IP
        rpc-whitelist-enabled = false;
        download-dir = "/mnt/ciberia/cypher_hub/torrents/downloads";
      };
    };
    tor = {
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
        nostr-server = {
          version = 3;
          map = [
            {
              port = 80;
              target = {
                addr = "127.0.0.1";
                port = 3000;
              };
            }
          ];
        };
      };
    };
    snowflake-proxy = {
      enable = true;
      capacity = 3;
    };

    # X11 + i3WM
    xserver = {
      enable = true;
      windowManager.i3.enable = true;
      xkb = {
        layout = "br";
        variant = "";
      };
      displayManager = {
        defaultSession = "none+i3";
        lightdm = {
          background = "/etc/lightdm/.background";
          greeters.slick = {
            enable = true;
          };
        };
      };
    };

    # Udev jade rules
    udev.extraRules = ''
      KERNEL=="ttyUSB*", SUBSYSTEMS=="usb", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", MODE="0660", GROUP="plugdev", TAG+="uaccess", TAG+="udev-acl", SYMLINK+="jade%n"
      KERNEL=="ttyACM*", SUBSYSTEMS=="usb", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="55d4", MODE="0660", GROUP="plugdev", TAG+="uaccess", TAG+="udev-acl", SYMLINK+="jade%n"
    '';
  };
}
