{
  services.calibre-web = {
    enable = true;
    openFirewall = true;
    listen.port = 8083;
    listen.ip = "0.0.0.0";
    options = {
      calibreLibrary = "/mnt/ciberia/cypher_hub/calibre";
      enableBookUploading = true;
      enableBookConversion = true;
    };
  };
}
