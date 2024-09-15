{ pkgs, ... }:
with pkgs; let
  nerdFonts = nerdfonts.override { fonts = [ "FiraCode" ]; };
in
{
  fonts.fontconfig.enable = true;
  home.packages = [
    nerdFonts
  ];
}
