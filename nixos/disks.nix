{
  fileSystems."/mnt/ciberia" = {
    device = "/dev/disk/by-uuid/fb7f61ed-7d32-46d8-a49c-3e827a25af93";
    fsType = "ext4";
  };
  fileSystems."/mnt/flame" = {
    device = "/dev/disk/by-uuid/7fb8b134-5992-42e1-b136-7d1088fd10fd";
    fsType = "ext4";
  };

  boot.initrd.luks = {
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
}
