{
  programs.firefox = {
    enable = true;
    languagePacks = [ "pt-BR" ];
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "browser.startup.homepage" = "https://chatgpt.com";
          "browser.search.defaultenginename" = "Google";
        };
        search = {
          force = true;
          default = "Google";
        };
      };
    };
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableForgetButton = true;
      DisableMasterPasswordCreation = true;
      DisablePrivateBrowsing = true;
      DisableFirefoxScreenshots = true;
      DisableSetDesktopBackground = true;
      TranslateEnabled = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
    };
  };
}
