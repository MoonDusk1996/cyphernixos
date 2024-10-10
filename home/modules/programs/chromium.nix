{ pkgs, ... }: {
  programs.chromium = {
    # enablePlasmaBrowserIntegration = true;
    # plasmaBrowserIntegrationPackage = true;
    enable = true;
    dictionaries = with pkgs; [
      hunspellDictsChromium.en_US
    ];
    extensions = [
      # Crypto wallet
      "iokeahhehimjnekafflcihljlcjccdbe" #Alby
      "nkbihfbeogaeaoehlefnkodbefgpgknn" #Meetamask
      "bfnaelmomeimhlpmgjnjophhpkkoljpa" #Phantom

      # Misc
      "bgnkhhnnamicmpeenaelnjfhikgbkllg" #Adguard
      "bhlhnicpbhignbdhedgjhgdocnmhomnp" #ColorZilla
      "cimiefiiaegbelhefglklhhakcgmhkai" # Plasma integration
    ];
  };
}
