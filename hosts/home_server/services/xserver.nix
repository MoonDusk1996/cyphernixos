{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
    windowManager.i3.enable = true;
    xkb = {
      layout = "br";
      variant = "";
    };
    displayManager = {
      setupCommands = ''
        ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-0 --mode 2560x1080 --rate 60 --primary --pos 0x768
        ${pkgs.xorg.xrandr}/bin/xrandr --output HDMI-1 --mode 1366x768 --rate 60  --pos 597x0
      '';
      defaultSession = "none+i3";
      lightdm = {
        background = pkgs.nixos-artwork.wallpapers.binary-black.gnomeFilePath;
        greeters.gtk = {
          enable = true;
          theme.name = "Adwaita-dark";
        };
      };
    };
  };
}
