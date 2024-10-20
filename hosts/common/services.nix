{
  services.gvfs.enable = true;

  # Udev jade rules
  services.udev.extraRules = ''
    KERNEL=="ttyUSB*", SUBSYSTEMS=="usb", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", MODE="0660", GROUP="plugdev", TAG+="uaccess", TAG+="udev-acl", SYMLINK+="jade%n"
    KERNEL=="ttyACM*", SUBSYSTEMS=="usb", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="55d4", MODE="0660", GROUP="plugdev", TAG+="uaccess", TAG+="udev-acl", SYMLINK+="jade%n"
  '';
}
