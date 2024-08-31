{ pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    dictionaries = with pkgs;
      [
        hunspellDictsChromium.en_US
      ];
    extensions = [
      # Crypto wallet
      "ihcjicgdanjaechkgeegckofjjedodee" #Alby
      "nkbihfbeogaeaoehlefnkodbefgpgknn" #Meetamask
      "bfnaelmomeimhlpmgjnjophhpkkoljpa" #Phantom

      # Misc
      "cimiefiiaegbelhefglklhhakcgmhkai" #Plasma integration
      "bgnkhhnnamicmpeenaelnjfhikgbkllg" #Adguard
      "bhlhnicpbhignbdhedgjhgdocnmhomnp" #ColorZilla
    ];
  };
}
