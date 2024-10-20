{ pkgs, ... }: {
  imports = [
    ./packages
    ./services
    ../../hardware-configuration.nix
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    initrd.luks = {
      devices = {
        "luks-c85cfb8a-6b23-4c0b-8250-714571c78631" = {
          device = "/dev/disk/by-uuid/c85cfb8a-6b23-4c0b-8250-714571c78631";
        };
        "ciberia" = {
          device = "/dev/disk/by-uuid/3d605ccd-16d4-4b1f-ad18-11d71cbd9c3e";
        };
        "flame" = {
          device = "/dev/disk/by-uuid/d0e627bb-98c3-439b-adf0-d114ca98befa";
        };
      };
    };
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 7;
    };
  };

  fileSystems = {
    "/mnt/ciberia" = {
      device = "/dev/disk/by-uuid/fb7f61ed-7d32-46d8-a49c-3e827a25af93";
      fsType = "ext4";
    };
    "/mnt/flame" = {
      device = "/dev/disk/by-uuid/7fb8b134-5992-42e1-b136-7d1088fd10fd";
      fsType = "ext4";
    };
  };

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
