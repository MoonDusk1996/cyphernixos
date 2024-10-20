{
  services.redshift = {
    enable = true;
    # Display temperature settings
    temperature = {
      day = 5700;
      night = 3500;
    };
    # General settings
    settings = {
      redshift.brightness-day = "1";
      redshift.brightness-night = "0.9";
    };
    # Schedule settings
    dawnTime = "6:00-7:45";
    duskTime = "16:35-19:15";
  };
}
