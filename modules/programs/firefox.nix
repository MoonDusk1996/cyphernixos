{
  programs.firefox = {
    enable = true;
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
  };
}
