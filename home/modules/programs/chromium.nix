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
      "iokeahhehimjnekafflcihljlcjccdbe" #Alby
      "nkbihfbeogaeaoehlefnkodbefgpgknn" #Meetamask
      "bfnaelmomeimhlpmgjnjophhpkkoljpa" #Phantom

      # Misc
      "bgnkhhnnamicmpeenaelnjfhikgbkllg" #Adguard
      "bhlhnicpbhignbdhedgjhgdocnmhomnp" #ColorZilla
    ];
  };
}
