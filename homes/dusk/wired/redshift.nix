{
  services.redshift = {
    enable = true;
    # Display temperature settings
    temperature = {
      day = 5700;
      night = 3500;
    };
    # General settings
    brightness = {
      day = "1";
      night = "0.9";
    };

    # Schedule settings
    dawnTime = "6:00-7:45";
    duskTime = "18:35-20:15";
  };
}
