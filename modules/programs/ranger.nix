{
  programs.ranger = {
    enable = true;
    rifle = [
      {
        condition = "mime ^image";
        command = ''feh --auto-zoom --scale-down --geometry 1920x1000 -- "$@"'';
      }
      {
        condition = "mime ^video";
        command = ''vlc -f -- "$@"'';
      }
    ];
  };
}
