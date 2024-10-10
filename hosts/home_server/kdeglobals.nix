{ config, ... }: {
  xdg.configFile."kdeglobals" = with config.colorScheme.palette; {
    text = ''
      [ColorEffects:Disabled]
      Color=#${base01}
      ColorAmount=0.30000000000000004
      ColorEffect=2
      ContrastAmount=0.1
      ContrastEffect=0
      IntensityAmount=-1
      IntensityEffect=0

      [ColorEffects:Inactive]
      ChangeSelectionColor=true
      Color=#${base01}
      ColorAmount=0.5
      ColorEffect=3
      ContrastAmount=0
      ContrastEffect=0
      Enable=true
      IntensityAmount=0
      IntensityEffect=0

      [Colors:Button]
      BackgroundAlternate=#${base07}
      BackgroundNormal=#${base02}
      DecorationFocus=#${base07}
      DecorationHover=#${base02}
      ForegroundActive=#${base09}
      ForegroundInactive=#${base04}
      ForegroundLink=#${base07}
      ForegroundNegative=#${base08}
      ForegroundNeutral=#${base0A}
      ForegroundNormal=#${base05}
      ForegroundPositive=#${base0B}
      ForegroundVisited=#${base0E}


      [Colors:Complementary]
      BackgroundAlternate=#${base03}
      BackgroundNormal=#${base00}
      DecorationFocus=#${base07}
      DecorationHover=#${base02}
      ForegroundActive=#${base09}
      ForegroundInactive=#${base04}
      ForegroundLink=#${base07}
      ForegroundNegative=#${base08}
      ForegroundNeutral=#${base0A}
      ForegroundNormal=#${base05}
      ForegroundPositive=#${base0B}
      ForegroundVisited=#${base0E}


      [Colors:Header]
      BackgroundAlternate=#${base03}
      BackgroundNormal=#${base00}
      DecorationFocus=#${base07}
      DecorationHover=#${base02}
      ForegroundActive=#${base09}
      ForegroundInactive=#${base04}
      ForegroundLink=#${base07}
      ForegroundNegative=#${base08}
      ForegroundNeutral=#${base0A}
      ForegroundNormal=#${base05}
      ForegroundPositive=#${base0B}
      ForegroundVisited=#${base0E}


      [Colors:Selection]
      BackgroundAlternate=#${base07}
      BackgroundNormal=#${base07}
      DecorationFocus=#${base07}
      DecorationHover=#${base02}
      ForegroundLink=#${base07}
      ForegroundInactive=#${base00}
      ForegroundActive=#${base09}
      ForegroundLink=#${base07}
      ForegroundNegative=#${base08}
      ForegroundNeutral=#${base0A}
      ForegroundNormal=#${base03}
      ForegroundPositive=#${base0B}
      ForegroundVisited=#${base0E}


      [Colors:Tooltip]
      BackgroundAlternate=27,25,35
      BackgroundNormal=#${base01}
      DecorationFocus=#${base07}
      DecorationHover=#${base02}
      ForegroundActive=#${base09}
      ForegroundInactive=#${base04}
      ForegroundLink=#${base07}
      ForegroundNegative=#${base08}
      ForegroundNeutral=#${base0A}
      ForegroundNormal=#${base05}
      ForegroundPositive=#${base0B}
      ForegroundVisited=#${base0E}


      [Colors:View]
      BackgroundAlternate=#${base00}
      BackgroundNormal=#${base01}
      DecorationFocus=#${base07}
      DecorationHover=#${base02}
      ForegroundActive=#${base09}
      ForegroundInactive=#${base04}
      ForegroundLink=#${base07}
      ForegroundNegative=#${base08}
      ForegroundNeutral=#${base0A}
      ForegroundNormal=#${base05}
      ForegroundPositive=#${base0B}
      ForegroundVisited=#${base0E}


      [Colors:Window]
      BackgroundAlternate=#${base03}
      BackgroundNormal=#${base00}
      DecorationFocus=#${base07}
      DecorationHover=#${base02}
      ForegroundActive=#${base09}
      ForegroundInactive=#${base04}
      ForegroundLink=#${base07}
      ForegroundNegative=#${base08}
      ForegroundNeutral=#${base0A}
      ForegroundNormal=#${base05}
      ForegroundPositive=#${base0B}
      ForegroundVisited=#${base0E}


      [General]
      ColorCustomBase16Nix
      Name=CustomBase16Nix
      accentActiveTitlebar=false
      shadeSortColumn=true


      [KDE]
      contrast=4


      [WM]
      activeBackground=#${base01}
      activeBlend=#${base05}
      activeForeground=#${base05}
      inactiveBackground=#${base03}
      inactiveBlend=#${base04}
      inactiveForeground=#${base04}
    '';
  };
}
